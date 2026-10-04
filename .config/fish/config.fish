if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if status is-interactive
    starship init fish | source
end
