# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

EDITOR=nvim
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"


export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

set -o vi
plugins=(git zsh-autosuggestions navi zsh-vi-mode )

source $ZSH/oh-my-zsh.sh

# zvm_after_init_commands+=(zsh-autosuggestions navi)

# function zvm_after_lazy_keybindings() {
#   bindkey -M vicmd 's' your_normal_widget
#   bindkey -M visual 'n' your_visual_widget
# }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


bindkey '^ ' autosuggest-accept
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# User configuration

alias vi=nvim
alias vim=nvim
alias tf=terraform
alias zap='gaa;gc -m "⚡️";gp'
alias lg='lazygit'
alias todo='todo.sh'

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" overwrite-mode
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
#Ctrl-left/right
bindkey '\e[1;5C' forward-word # ctrl right
bindkey '\e[1;5D' backward-word # ctrl left o
#alt-left/right
bindkey "\e[1;3C" forward-word 
bindkey "\e[1;3D" backward-word
#bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, cant hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix


export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

gitbranches () {
  git for-each-ref --sort='-committerdate:iso8601' --format=' %(committerdate:iso8601)%09%(refname)' refs/heads
}

aws_login () {
  eval "$(~/hummingbird-infra/scripts/login ali $1)"
}

assume_sandbox () {
  eval $(~/hummingbird-infra/scripts/assume-role  arn:aws:iam::540894806611:role/StagingAdmin)
}

ecr_login () {
  aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 540894806611.dkr.ecr.us-west-2.amazonaws.com
}

docker_tag () {
   docker tag $1:latest 540894806611.dkr.ecr.us-west-2.amazonaws.com/$1:latest
}

if [ -e /Users/ali/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ali/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
eval "$(direnv hook zsh)"

copy_function() {
	test -n "$(declare -f "$1")" || return 
	eval "${_/$1/$2}"
}

copy_function _direnv_hook _direnv_hook__old

_direnv_hook() {
	_direnv_hook__old "$@" 2> >(egrep -v '^direnv: (export)')
}

function zvm_after_lazy_keybindings() {
  # Here we define the custom widget
  zvm_define_widget _navi_widget

  # In normal mode, press Ctrl-E to invoke this widget
  zvm_bindkey vicmd '^G' _navi_widget
  zvm_bindkey viins '^ ' autosuggest-accept
}

cd ~/hummingbird-rails
eval export PATH="/Users/ali/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
# source '/opt/homebrew/Cellar/rbenv/1.2.0/libexec/../completions/rbenv.zsh'
# command rbenv rehash 2>/dev/null
# rbenv() {
#   local command
#   command="${1:-}"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi
#
#   case "$command" in
#   rehash|shell)
#     eval "$(rbenv "sh-$command" "$@")";;
#   *)
#     command rbenv "$command" "$@";;
#   esac
# }

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix