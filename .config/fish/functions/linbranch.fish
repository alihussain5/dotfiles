function linbranch
    if test (count $argv) -eq 0
        echo 'usage: linbranch <title...>' >&2
        return 2
    end

    set -l title (string join ' ' -- $argv)

    if not git rev-parse --git-dir >/dev/null 2>&1
        echo 'linbranch: not inside a git repository' >&2
        return 1
    end

    if git diff --cached --quiet
        echo "linbranch: no staged changes; stage files with 'git add' first" >&2
        return 1
    end

    set -l output (linear issue create --no-interactive --team CAS --assignee self --title "$title" 2>&1)
    if test $status -ne 0
        echo 'linbranch: linear issue create failed' >&2
        printf '%s\n' $output >&2
        return 1
    end
    printf '%s\n' $output

    set -l urls (string match -r -a 'https://linear\.app/[^[:space:]]+/issue/[^[:space:]]+' -- $output)
    if test (count $urls) -eq 0
        echo 'linbranch: could not parse Linear issue URL from output' >&2
        return 1
    end

    set -l branch (string replace -r '^.*/issue/' '' -- $urls[1])
    command gs branch create "$branch" -m "$title"
end
