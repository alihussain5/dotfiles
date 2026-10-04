# Config Instructions

My development environment configuration. Using `Ghostty` + `tmux` + `neovim` + `zsh`

## Initial setup

Install [Homebrew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install MesloLGS Nerd Font files
- [MesloLGS NF Regular](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Install [Ghostty](https://ghostty.org/)

```bash
brew install --cask ghostty
```

Install [Oh My Zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [Z Plug](https://github.com/zplug/zplug)

```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

Install [powerlevel10k](https://github.com/romkatv/powerlevel10k)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Clone this repository

```bash
yadm clone https://github.com/alihussain5/dotfiles.git
```

Install Tmux plugin manager

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Restart everything

Install zsh plugins

```bash
zplug install
```

In Tmux, press  `~ + I` to install tmux plugins

Install important packages

```bash
brew install neovim yadm fzf ripgrep navi gh lazygit tmux
```

Ghostty uses the tracked Kanagawa Wave theme from `~/.config/ghostty/config.ghostty`.


## Linux setup

Install Homebrew prerequisites on Debian or Ubuntu:

```bash
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git
```

Install Homebrew and load it into the current shell:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Clone the dotfiles and install the cross-platform bundle:

```bash
yadm clone https://github.com/alihussain5/dotfiles.git
brew bundle --file="$HOME/.config/homebrew/Brewfile"
```

macOS-only taps, formulae, and casks are skipped automatically.
