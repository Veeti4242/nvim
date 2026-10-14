# Neovim config

A small Neovim configuration for C development on Debian/WSL.

- lazy.nvim manages plugins.
- clangd provides diagnostics, completion, definitions, and renaming.
- blink.cmp provides completion with manual documentation popups.
- Telescope searches files and project text.
- nvim-tree provides a left file sidebar.
- which-key shows shortcut reminders.
- Tokyo Night theme, relative line numbers, and a built-in status line.

## Install on another PC

Requires Neovim 0.11.3 or newer, Git, clangd, and ripgrep.
Install Neovim separately; Debian's package may be older than required.

```sh
sudo apt install git clangd ripgrep
git clone git@github.com:Veeti4242/nvim.git ~/.config/nvim
nvim
```

If `~/.config/nvim` already exists, back it up before cloning.
Let plugins install, run `:Lazy restore` to use the committed plugin versions,
then restart Neovim. Open Neovim from your project directory.

## Shortcuts

Leader is Space. Use these in normal mode.

| Keys | Action |
| --- | --- |
| Space ff | Find files |
| Space fg | Search project text |
| Space fb | Switch open buffers |
| Space e | Toggle file sidebar |
| Space pv | Open built-in directory browser |
| Space rn | Rename symbol |
| Space d | Show diagnostic |
| Space dn / Space dp | Next / previous diagnostic |
| gd / gr | Definition / references |
| K | Show documentation |
| Space cs | Show function signature |
| Space ca | Code actions |

In the sidebar, Enter opens files or expands folders; `g?` shows help.
Ctrl-w then h/l moves between the sidebar and code.

In insert mode, Ctrl-n / Ctrl-p selects a completion, Ctrl-y accepts it,
and Ctrl-e closes the menu. Ctrl-Space requests completion or documentation.
Enter inserts a newline; documentation and signature popups stay manual.

## Customize

Settings and shortcuts live in `lua/config/`; plugin settings live in
`lua/plugins/`. Start with `options.lua` and `keymaps.lua`.

## Sync and update

Before editing the config on either PC, run `git pull --ff-only` in this
repository. After pulling, run `:Lazy restore` and restart Neovim.

Before updating plugins with `:Lazy update`, commit your working config and
`lazy-lock.json`. Restart and check the update before committing and pushing
the new lockfile. To undo a plugin update, restore the previous lockfile from
Git, run `:Lazy restore`, and restart.

Neovim, clangd, ripgrep, and terminal settings are installed separately on each PC.
