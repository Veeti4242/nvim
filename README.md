# Small Neovim setup

Open Neovim from your project directory so file search searches that project.

## First launch

Install the external tools in your Debian terminal:

```sh
sudo apt install clangd ripgrep
~/.local/opt/nvim-linux-x86_64/bin/nvim
```

The full path selects your upgraded Neovim. If `nvim --version` already shows
0.12.6 in your terminal, you can simply use `nvim`.
The first launch downloads lazy.nvim and the plugins from GitHub.
Let installation finish, then restart Neovim. Open a C file and run
`:checkhealth vim.lsp` to check clangd. Use `:Lazy` to inspect plugins;
`:Lazy update` updates them. Keep the generated `lazy-lock.json` to record
installed revisions; `:Lazy restore` restores those revisions.

## Shortcuts

Leader means Space. These shortcuts are used in normal mode (press Escape first).

| Keys | Action |
| --- | --- |
| Space ff | Find files in the current working directory |
| Space fg | Search project text (needs ripgrep) |
| Space fb | Switch open buffers |
| Space e | Toggle the file sidebar on the left |
| Space pv | Same directory browser; preserves your old shortcut |
| Space rn | Rename symbol |
| Space d | Show diagnostic under the cursor |
| Space dn / Space dp | Next / previous diagnostic |
| gd | Go to definition |
| gr | Find references |
| K | Show documentation |
| Space cs | Show function signature |
| Space ca | Code actions |
| Escape | Clear search highlighting |

LSP shortcuts become available when clangd attaches to a C/C++ file.
Pause after Space to see shortcut reminders. In Telescope, type to filter,
use Ctrl-n / Ctrl-p or arrows to select, Enter to open, and Escape to close.
In netrw, Enter opens a file/directory and `-` goes to its parent directory.
In the sidebar, Enter opens files or expands folders, `a` creates a file,
`r` renames, and `g?` shows help. Use Ctrl-w then l to move to your code,
and Ctrl-w then h to return to the sidebar.

### Completion (insert mode)

Suggestions appear as you type; they never insert text just by being selected.

| Keys | Action |
| --- | --- |
| Ctrl-n / Ctrl-p or arrows | Select next / previous suggestion |
| Ctrl-y | Accept selected suggestion (or the first if none selected) |
| Ctrl-e | Close completion menu |
| Ctrl-Space | Request completion; press again for selected item's documentation |
| Tab / Shift-Tab | Move through snippet placeholders, otherwise normal Tab |

Enter inserts a newline. Automatic documentation, signature popups, and inline
diagnostic text are disabled. Some terminals intercept Ctrl-Space; automatic
completion and Ctrl-y still work. Normal-mode K requests symbol documentation.

## Change it gradually

- `lua/config/options.lua`: indentation, line numbers, status line, diagnostics.
- `lua/config/keymaps.lua`: general and language shortcuts.
- `lua/config/lazy.lua`: plugin manager bootstrap.
- `lua/plugins/navigation.lua`: file sidebar, Telescope, and which-key.
- `lua/plugins/completion.lua`: completion behavior.
- `lua/plugins/lsp.lua`: clangd configuration.
- `lua/plugins/theme.lua`: theme.

Neovim's built-in syntax highlighting is enabled by default. There is no
automatic formatting, build system, or clipboard integration.
Continue compiling in a second terminal pane. For larger C projects, clangd
uses `compile_commands.json` to understand compiler flags and include paths.

Your previous entry point is saved in `backup/init.lua.before-setup`; the
original `lua/veeti/` files remain intact. To restore that setup, copy the saved
entry point over `init.lua`.

Plugin API references: [lazy.nvim](https://lazy.folke.io/installation),
[Neovim LSP configs](https://github.com/neovim/nvim-lspconfig),
[Blink v1 keymaps](https://cmp.saghen.dev/configuration/keymap).

## Share between PCs

Keep this directory in its own Git repository, including `lazy-lock.json`.
On another PC, install a compatible Neovim, Git, clangd, and ripgrep first.
If `~/.config/nvim` already exists, move it to a backup before cloning this
repository there. Open Neovim, let plugins install, and run `:Lazy restore`
to match the committed plugin revisions. Restart Neovim afterwards.

Before changing the configuration on either PC:

```sh
cd ~/.config/nvim
git pull --ff-only
```

After pulling, run `:Lazy restore` in Neovim and restart. After making and
checking your own changes, including successful plugin updates:

```sh
cd ~/.config/nvim
git add init.lua lua README.md .gitignore lazy-lock.json
git commit -m "Describe your configuration change"
git push
```

The repository shares configuration and plugin revisions; Neovim itself,
clangd, ripgrep, fonts, and terminal settings are installed separately on each PC.
