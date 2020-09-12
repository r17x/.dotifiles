# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
# export LC_CTYPE="en_US.UTF-8"
# this function only check for not directory exist.
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY=$(tty)
export ZSH=~/.oh-my-zsh
# export ZPLUG_HOME=~/.zplug
ctags=/usr/local/bin/ctags

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=darwin;;
    CYGWIN*)    machine=cygwin;;
    MINGW*)     machine=minGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# define ARCHFLAGS when using `Linux`
[[ $machine == *"linux"* ]] && export ARCHFLAGS="-arch x86_64"

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.fnm:$PATH # fnm (multiple node.js)
eval "`fnm env --multi`" # fnm init
export PATH="$(yarn global bin):$PATH" # fnm (yarn global)
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk" # java_home /usr/libexec/java_home -v x.x
export DENO_INSTALL=~/.deno
export PATH="$DENO_INSTALL/bin:$PATH"
# Ruby
# Archwiki: https://wiki.archlinux.org/index.php/Ruby#Installing_gems_per-user_or_system-wide
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

source ~/.profile.android
source ~/.aliases
# source $ZSH/oh-my-zsh.sh
#### SECRET ####
export GITHUB_USER="ri7nz"
. <(gpg --no-tty -qd ~/acs.gpg)


# emcc/c\c++/wasm environment 
# [[ -r ~/emsdk ]] && source ~/emsdk/emsdk_env.sh

# Rust environment 
[[ -r ~/.cargo/env ]] && source ~/.cargo/env

# opam configuration
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ocaml environment 
eval $(opam env)


#####################
# FZF Configuration #
#####################

[ -f /usr/share/fzf/key-bindings.zsh ] && \
    source /usr/share/fzf/key-bindings.zsh && \
    source /usr/share/fzf/completion.zsh ]
# Feed the output of fd into fzf
# fd --type f | fzf

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


##################
# Aloxaf/fzf-tab #
# style config   #
##################

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
    Aloxaf/fzf-tab \ 
    knu/zsh-manydots-magic

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

zt 0c light-mode for \
    pack'bgn-binary' \
        junegunn/fzf \
    sbin from'gh-r' submods'NICHOLAS85/zsh-fast-alias-tips -> plugin' pick'plugin/*.zsh' \
        sei40kr/fast-alias-tips-bin

zt 0c light-mode pick'/dev/null' for \
    sbin'fd*/fd;fd*/fd -> fdfind' from"gh-r" \
         @sharkdp/fd \
    sbin'bin/git-ignore' atload'export GI_TEMPLATE="$PWD/.git-ignore"; alias gi="git-ignore"' \
        laggardkernel/git-ignore


zt 0c light-mode as'null' for \
    sbin"bin/git-dsf;bin/diff-so-fancy" \
        zdharma/zsh-diff-so-fancy \
    sbin \
        paulirish/git-open

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    taskwarrior
    time
    newline
)

setopt autocd autopushd 
