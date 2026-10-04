set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/homebrew/Brewfile
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'

if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

fish_add_path --global $HOME/.local/bin $HOME/.config/emacs/bin

if status is-interactive
    if functions -q fisher; and not test -e $__fish_config_dir/functions/fisher.fish
        fisher update
    end

    abbr --add vi nvim
    abbr --add vim nvim
    abbr --add lg lazygit
    abbr --add pi 'pi -nc'
    abbr --add zap 'gaa; gc -m "⚡️"; gp'
    abbr --add gsr 'gs rs; gs sr; gs ss'

    if type -q direnv
        direnv hook fish | source
    end

    if type -q navi
        set -q fish_key_bindings; or set -g fish_key_bindings fish_default_key_bindings
        navi widget fish | source
    end

    starship init fish | source
    enable_transience
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

if status is-interactive
    fish_user_key_bindings
end
