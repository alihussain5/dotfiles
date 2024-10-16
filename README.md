# Config Instructions

My development environment configuration. Using `kitty` + `tmux` + `neovim` + `zsh`

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

Install [Kitty](https://sw.kovidgoyal.net/kitty/)

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
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

Setup kitty theme

```bash
kitty +kittens theme kanagawa
```


## Linux extras

Installing latest neovim on debian

```bash
sudo apt remove neovim
sudo apt install python3-launchpadlib -y
sudo apt install ninja-build gettext cmake unzip curl file
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i --force-overwrite  nvim-linux64.deb
```
