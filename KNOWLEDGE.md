# Mac Setup Knowledge

Use this file when restoring these configs on a new macOS machine.

## What Is Included

The config folders in this repo contain your portable app and shell configs. They do not include installed binaries, package-manager state, private keys, auth tokens, or generated dependency folders.

`fzf` config is included:

```text
shell-config/fzf.bash
shell-config/fzf.zsh
fish-config/fish_plugins
fish-config/functions/
fish-config/conf.d/
```

The actual `fzf` binary still needs to be installed on the Mac.

## Install Core Tools On macOS

Install Homebrew first from https://brew.sh, then install the tools used by these configs:

```sh
brew install neovim fish tmux fzf ripgrep fd git gh btop htop neofetch pnpm go pyenv gcc
brew install --cask alacritty
```

Optional or project-specific tools referenced by shell/config files:

```sh
brew install deno
curl -fsSL https://bun.sh/install | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
```

Install opencode using the current upstream instructions, then restore `opencode-config/opencode.jsonc` and replace the redacted API key locally.

## Restore Configs

From this repo root:

```sh
mkdir -p ~/.config
rsync -a neovim-config/ ~/.config/nvim/
rsync -a fish-config/ ~/.config/fish/
rsync -a alacritty-config/ ~/.config/alacritty/
rsync -a git-config/ ~/.config/git/
rsync -a gh-config/ ~/.config/gh/
rsync -a pnpm-config/ ~/.config/pnpm/
mkdir -p ~/.config/solana/cli
cp solana-config/config.yml ~/.config/solana/cli/config.yml
rsync -a opencode-config/ ~/.config/opencode/
cp tmux-config/tmux.conf ~/.tmux.conf
cp tmux-config/config.tmux.conf ~/.config/.tmux.conf
cp shell-config/zshrc ~/.zshrc
cp shell-config/zshenv ~/.zshenv
cp shell-config/profile ~/.profile
cp shell-config/fzf.zsh ~/.fzf.zsh
cp shell-config/fzf.bash ~/.fzf.bash
cp git-config/gitconfig ~/.gitconfig
```

macOS does not use i3, Flameshot, or Linux `xmodmap` in the same way. Keep these folders for reference, but do not expect them to work unchanged:

```text
i3-config/
flameshot-config/
shell-config/bashrc
```

## Paths To Fix On macOS

Several current shell files contain Linux-specific paths from this machine:

```text
/home/nagmani
/home/linuxbrew/.linuxbrew
```

On Apple Silicon Macs, Homebrew is usually at:

```text
/opt/homebrew
```

On Intel Macs, Homebrew is usually at:

```text
/usr/local
```

Update these files after copying:

```text
fish-config/config.fish
shell-config/bashrc
shell-config/zshrc
shell-config/profile
solana-config/config.yml
```

Prefer `$HOME` instead of hardcoding `/home/nagmani` on macOS.

## Fish Setup

After installing Fish:

```sh
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

For Intel Macs, replace `/opt/homebrew/bin/fish` with `/usr/local/bin/fish`.

Install Fisher and Fish plugins:

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher patrickf1/fzf.fish jorgebucaran/nvm.fish
```

## fzf Setup

Homebrew installs the binary, but shell integration may need setup:

```sh
brew install fzf
$(brew --prefix)/opt/fzf/install
```

Your Bash and Zsh startup files source:

```sh
~/.fzf.bash
~/.fzf.zsh
```

Fish uses the `patrickf1/fzf.fish` plugin listed in `fish-config/fish_plugins`.

## tmux Setup

Your tmux prefix is `F1`:

```tmux
set-option -g prefix F1
```

Install TPM:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

The themed config references Catppuccin, tmux-cpu, and tmux-battery plugin paths. If those paths do not exist on the Mac, either install them through TPM or clone them where the config expects them:

```sh
mkdir -p ~/.config/tmux/plugins/catppuccin ~/.config/tmux/plugins/tmux-plugins
git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin/tmux
git clone https://github.com/tmux-plugins/tmux-cpu ~/.config/tmux/plugins/tmux-plugins/tmux-cpu
git clone https://github.com/tmux-plugins/tmux-battery ~/.config/tmux/plugins/tmux-plugins/tmux-battery
```

## AltGr To F1 Mapping

On this Linux machine, `AltGr` is remapped to `F1` using:

```sh
xmodmap -e "keycode 108 = F1"
```

That is why `AltGr` works like the tmux prefix key here.

macOS does not use `xmodmap`. If you want the same behavior on a Mac, use Karabiner-Elements and map the physical key you want, usually right Option, to `F1`. If you are fine pressing the actual `F1` key, no remap is needed.

## Secrets Not Included

These were intentionally not copied or should stay redacted:

```text
~/.npmrc
~/.config/solana/id.json
~/.ssh/*
opencode API key
GitHub auth tokens
```

Set them up manually on the Mac:

```sh
gh auth login
npm login
solana-keygen new --outfile ~/.config/solana/id.json
```

If you already have an existing Solana keypair, transfer it securely instead of committing it to this repo.

## Neovim Notes

Neovim config is based on LazyVim. After restoring:

```sh
nvim
```

Let Lazy install plugins. Useful external tools for this setup include:

```text
ripgrep
fd
fzf
git
node/npm/pnpm
rust/cargo
go
gcc/g++
```

Mason/LazyVim will manage many language servers, but system compilers and runtimes should be installed through Homebrew or their official installers.

## Configs That Are Linux-Specific

These are useful as reference but are not directly portable to macOS:

```text
i3-config/      # i3 is Linux/X11-specific
flameshot-config/ # Flameshot behavior differs on macOS
xmodmap lines   # Linux/X11-only keyboard remapping
```

For tiling on macOS, consider Aerospace or yabai instead of i3.
