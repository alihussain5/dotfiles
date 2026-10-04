# Dotfiles

Cross-platform development environment managed with Homebrew, YADM, Ghostty, tmux, Fish, and Neovim.

The account login shell can remain Zsh or another POSIX-compatible shell. Ghostty and tmux launch Fish for interactive terminal sessions.

## macOS setup

Install [Homebrew](https://brew.sh/):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Bootstrap the Homebrew bundle:

```bash
curl -fsSL https://raw.githubusercontent.com/alihussain5/dotfiles/main/.config/homebrew/Brewfile -o /tmp/dotfiles.Brewfile
brew bundle --file=/tmp/dotfiles.Brewfile
```

The bundle installs YADM, Ghostty, Fish, Fisher, Starship, tmux, Neovim, the configured MesloLG Nerd Font, and the remaining development tools.

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

Bootstrap the cross-platform Homebrew bundle:

```bash
curl -fsSL https://raw.githubusercontent.com/alihussain5/dotfiles/main/.config/homebrew/Brewfile -o /tmp/dotfiles.Brewfile
brew bundle --file=/tmp/dotfiles.Brewfile
```

macOS-only casks are skipped automatically. Install Ghostty through the Linux package provided for your distribution.

## Dotfiles

Clone the YADM repository:

```bash
yadm clone https://github.com/alihussain5/dotfiles.git
```

Apply the tracked bundle after cloning:

```bash
brew bundle --file="$HOME/.config/homebrew/Brewfile"
```

## tmux plugins

Install TPM and all tracked tmux plugins, including the Dracula theme:

```bash
test -d "$HOME/.tmux/plugins/tpm" || git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
"$HOME/.tmux/plugins/tpm/bin/install_plugins"
```

TPM plugins are cloned locally and are not stored in the YADM repository. Run the install command once on each new machine, then start a new tmux session. In an existing session, reload the config with `tmux source-file ~/.tmux.conf`.

## Start

Fully restart Ghostty after the initial setup. Ghostty loads the tracked Kanagawa Wave configuration and launches Fish. New tmux panes and windows also launch Fish.
