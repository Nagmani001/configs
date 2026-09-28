# Personal Configs

This repository keeps the portable configuration files from this machine in one place.

## Layout

| Folder | Source path | Purpose |
| --- | --- | --- |
| `neovim-config/` | `~/.config/nvim/` | Neovim / LazyVim setup |
| `fish-config/` | `~/.config/fish/` | Fish shell config, functions, completions, themes, plugins |
| `tmux-config/` | `~/.tmux.conf`, `~/.config/.tmux.conf` | tmux keybindings, prefix, theme, pane navigation |
| `alacritty-config/` | `~/.config/alacritty/` | Alacritty terminal config |
| `i3-config/` | `~/.config/i3/` | i3 window manager config |
| `git-config/` | `~/.config/git/` | Git ignore/config snippets |
| `gh-config/` | `~/.config/gh/` | GitHub CLI config without auth tokens |
| `pnpm-config/` | `~/.config/pnpm/` | pnpm config |
| `solana-config/` | `~/.config/solana/cli/config.yml` | Solana CLI config without keypair |
| `btop-config/` | `~/.config/btop/` | btop config and themes |
| `htop-config/` | `~/.config/htop/` | htop config |
| `flameshot-config/` | `~/.config/flameshot/` | Flameshot screenshot config |
| `neofetch-config/` | `~/.config/neofetch/` | Neofetch config |
| `opencode-config/` | `~/.config/opencode/` | opencode config files |
| `shell-config/` | `~/.bashrc`, `~/.zshrc`, `~/.profile`, fzf files | Shell startup files |
| `Brewfile` | macOS Homebrew bundle | Tool install list for a new Mac |
| `KNOWLEDGE.md` | setup notes | macOS restore notes and gotchas |

Generated/dependency folders and logs are intentionally not copied here, including `node_modules/` and log files. Existing Git metadata, such as `neovim-config/.git/`, may remain if a config folder was originally cloned.

Secrets should not be committed. `opencode-config/opencode.jsonc` keeps the config shape, but its API key is redacted and must be replaced locally if restored. `~/.npmrc`, Solana keypairs, SSH keys, and GitHub auth tokens are intentionally not included.

## Restore

Copy the folders back to their matching paths. Example commands:

```sh
rsync -a neovim-config/ ~/.config/nvim/
rsync -a fish-config/ ~/.config/fish/
rsync -a alacritty-config/ ~/.config/alacritty/
rsync -a i3-config/ ~/.config/i3/
rsync -a git-config/ ~/.config/git/
rsync -a gh-config/ ~/.config/gh/
rsync -a pnpm-config/ ~/.config/pnpm/
mkdir -p ~/.config/solana/cli
cp solana-config/config.yml ~/.config/solana/cli/config.yml
rsync -a btop-config/ ~/.config/btop/
rsync -a htop-config/ ~/.config/htop/
rsync -a flameshot-config/ ~/.config/flameshot/
rsync -a neofetch-config/ ~/.config/neofetch/
rsync -a opencode-config/ ~/.config/opencode/
cp tmux-config/tmux.conf ~/.tmux.conf
cp tmux-config/config.tmux.conf ~/.config/.tmux.conf
cp shell-config/bashrc ~/.bashrc
cp shell-config/bash_logout ~/.bash_logout
cp shell-config/profile ~/.profile
cp shell-config/zshrc ~/.zshrc
cp shell-config/zshenv ~/.zshenv
cp shell-config/fzf.bash ~/.fzf.bash
cp shell-config/fzf.zsh ~/.fzf.zsh
cp git-config/gitconfig ~/.gitconfig
```

## Keyboard Note

`shell-config/bashrc` contains this machine-specific mapping:

```sh
xmodmap -e "keycode 108 = F1"
```

On this machine, keycode `108` is `AltGr`. This makes `AltGr` behave like `F1`, which matches the tmux config where `F1` is used as the prefix key.
