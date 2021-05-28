# see https://github.com/fish-shell/fish-shell/blob/master/share/functions/__terlar_git_prompt.fish
function __terlar_git_prompt --description 'Write out the git prompt'
    # If git isn't installed, there's nothing we can do
    # Return 1 so the calling prompt can deal with it
    if not command -sq git
        return 1
    end
    set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -z $branch
        return
    end

    echo -n ' '

    set -l index (git status --porcelain 2>/dev/null|cut -c 1-2|sort -u)

    if test -z "$index"
        set_color $fish_color_git_clean
        echo -n $branch'✓'
        set_color normal
        return
    end

    set -l gs
    set -l staged

    for i in $index
        if string match -rq '^[AMRCD]' -- $i
            set staged 1
        end

        # HACK: To allow matching a literal `??` both with and without `?` globs.
        set -l dq '??'
        switch $i
            case 'A '
                set -a gs added
            case 'M ' ' M'
                set -a gs modified
            case 'R '
                set -a gs renamed
            case 'C '
                set -a gs copied
            case 'D ' ' D'
                set -a gs deleted
            case "$dq"
                set -a gs untracked
            case 'U*' '*U' DD AA
                set -a gs unmerged
        end
    end

    if set -q staged[1]
        set_color $fish_color_git_staged
    else
        set_color $fish_color_git_dirty
    end

    echo -n $branch'⚡'

    for i in $fish_prompt_git_status_order
        if contains $i in $gs
            set -l color_name fish_color_git_$i
            set -l status_name fish_prompt_git_status_$i

            set_color $$color_name
            echo -n $$status_name
        end
    end

    set_color normal
end

# Defined interactively
function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # User
    # set_color $fish_color_user
    # echo -n $USER
    # set_color normal

    # echo -n '@'

    # Host
    # set_color $fish_color_host
    # echo -n (prompt_hostname)
    # set_color normal

    # echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end
    set_color $fish_color_git_dirty
    echo -n 'λ> '
    set_color normal
end
