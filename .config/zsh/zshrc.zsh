##################
#     zinit      #
##################
##################
# Aloxaf/fzf-tab #
# style config   #
##################

# fix: issue fork/exec /bin/zsh invalid argument
# see: https://github.com/Aloxaf/fzf-tab/issues/77#issuecomment-620626544
# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# (experimental, may change in the future)
# some boilerplate code to define the variable `extract` which will be used later
# please remember to copy them
local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# give a preview of directory by exa when completing cd
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'

eval "$(fasd --init auto)"
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"

autoload -Uz _zinit

(( ${+_comps} )) && _comps[zinit]=_zinit
# read https://github.com/sorin-ionescu/prezto/blob/b01f02aa5c6714430647a4ee854149e9a336270a/modules/completion/init.zsh#L31-L41 
autoload -Uz compinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
  compinit -i -C
else
  compinit -i
fi
unset _comp_files

### End of Zinit installer's chunk


# Functions to make configuration less verbose
# zt() : First argument is a wait time and suffix, ie "0a". Anything that doesn't match will be passed as if it were an ice mod. Default ices depth'3' and lucid
# zct(): First argument provides $MYPROMPT value used in load'' and unload'' ices. Sources a config file with tracking for easy unloading using $MYPROMPT value. Small hack to function in for-syntax
zt()  { zinit depth'3' lucid ${1/#[0-9][a-c]/wait"$1"} "${@:2}"; }
zct() { .zinit-ice load"[[ \${MYPROMPT} = ${1} ]]" unload"[[ \${MYPROMPT} != ${1} ]]" \
        atinit'![ -f "${thmf}/${MYPROMPT}-pre" ] && source "${thmf}/${MYPROMPT}-pre"' \
        atload'![ -f "${thmf}/${MYPROMPT}-post" ] && source "${thmf}/${MYPROMPT}-post"'; \
        ZINIT_ICE+=("${(kv)ZINIT_ICES[@]}"); ___turbo=1;}

##################
# Initial Prompt #
# Config source  #
##################
zt for \
    pick'async.zsh' light-mode \
        mafredri/zsh-async \
    atload'!source "$HOME/.p10k.zsh"' silent \
        romkatv/powerlevel10k

###########
# Annexes #
###########

zt light-mode compile'*handler' for \
   zinit-zsh/z-a-rust \
   zinit-zsh/z-a-as-monitor \
   zinit-zsh/z-a-patch-dl \
   zinit-zsh/z-a-bin-gem-node \
   zinit-zsh/z-a-submods

# Plugins
zt for \
    OMZL::git.zsh \
    OMZL::history.zsh \
    OMZP::fasd \
    dominik-schwabe/zsh-fnm \
    Aloxaf/fzf-tab \
    g-plane/icd \
    ri7nz/zsh-yarn

######################
# Trigger-load block #
######################

zt light-mode for \
   trigger-load'!man' \
        ael-code/zsh-colored-man-pages \
   trigger-load'!ga;!gcf;!gclean;!gd;!glo;!grh;!gss' \
        wfxr/forgit 
   
##################
# Wait'0a' block #
##################

zt 0a light-mode for \
        OMZL::completion.zsh \
    as'completion' mv'*.zsh -> _git' \
        felipec/git-completion \
    has'systemctl' \
        OMZP::systemd \
        OMZP::sudo \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    compile'{src/*.zsh,src/strategies/*}' pick'zsh-autosuggestions.zsh' \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions

##################
# Wait'0b' block #
##################

zt 0b light-mode for \
    pick'autoenv.zsh' nocompletions \
        Tarrasch/zsh-autoenv \
    atinit'zicompinit; zicdreplay' atload'FAST_HIGHLIGHT[chroma-man]=' \
        zdharma/fast-syntax-highlighting

##################
# Wait'0c' block #
##################

zt 0c light-mode pick'/dev/null' for \
    sbin'fd*/fd;fd*/fd -> fdfind' from"gh-r" \
         @sharkdp/fd \
    sbin'bin/git-ignore' atload'export GI_TEMPLATE="$PWD/.git-ignore"; alias gi="git-ignore"' \
        laggardkernel/git-ignore


zt 0c light-mode as'null' for \
    sbin"bin/git-dsf;bin/diff-so-fancy" \
        zdharma/zsh-diff-so-fancy \
    sbin \
        paulirish/git-open \

zct light-mode from'gh-r' for \
    as'program' sei40kr/fast-alias-tips-bin \
    sei40kr/zsh-fast-alias-tips
    
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    taskwarrior
    time
    newline
)

# example:
# $ ls 
# - dir1
# $ dir1 // cd dir1
setopt  autocd autopushd 
#####################
# FZF Configuration #
#####################

bindkey -e

[ -f ~/.fzf.zsh ] && \
    source ~/.fzf.zsh

[ -f /usr/share/fzf/key-bindings.zsh ] && \
    source /usr/share/fzf/key-bindings.zsh && \
    source /usr/share/fzf/completion.zsh ]
# Feed the output of fd into fzf
# fd --type f | fzf

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

# auto cd when selected directory in FZF preview
# fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
#       -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
# }

#### LOG ####
export NVIM_COC_LOG_FILE="$HOME/log/nvim.coc.log"
export NVIM_PYTHON_LOG_FILE="$HOME/log/nvim.python.log"
export XDG_RUNTIME_DIR="$HOME/log/xdg"
#### LOG ####
