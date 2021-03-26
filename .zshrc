### TOP ###
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
### TOP ###

# Common
# export LC_CTYPE="en_US.UTF-8"
# this function only check for not directory exist.
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export ZSH=~/.oh-my-zsh
export EDITOR=vim
### Machine portable detect ###
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=darwin;;
    CYGWIN*)    machine=cygwin;;
    MINGW*)     machine=minGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
### Machine portable detect ###
### FLAG ###
# define ARCHFLAGS when using `Linux`
[[ $machine == *"linux"* ]] && export ARCHFLAGS="-arch x86_64"
### FLAG ###
export DENO_HOME=$HOME/.deno
export DENO_BIN=$DENO_HOME/bin
export CARGO_HOME=$HOME/.cargo
export CARGO_BIN=$CARGO_HOME/bin
export LOCAL_BIN=$HOME/.local/bin
export FNM_HOME=$HOME/.fnm
export FNM_BIN=$FNM_HOME
export YARN_BIN="`yarn global bin`"
# export JAVA_HOME="/usr/lib/jvm/default" # java_home /usr/libexec/java_home -v x.x
# export JDK_HOME="/usr/lib/jvm/java-8-openjdk/jre/" # java_home /usr/libexec/java_home -v x.x
# see .profile.android
# Ruby
# Archwiki: https://wiki.archlinux.org/index.php/Ruby#Installing_gems_per-user_or_system-wide
export RUBY_BIN="`ruby -e 'puts Gem.user_dir'`/bin"
### BASE PATH ###
export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/bin/core_perl/:$HOME/.local/bin:$HOME/scripts/bin
### BASE PATH ###


### DEVELOPMENT PATH (environment) ###
export PATH=$FNM_BIN:$YARN_BIN:$PATH:$RUBY_BIN # fnm (multiple node.js)
export ctags=/usr/local/bin/ctags
eval "`fnm env `" # fnm init

# TODO make it with .autoenv (base on directory) - ondemand load path
# emcc/c\c++/wasm environment 
# [[ -r ~/emsdk ]] && source ~/emsdk/emsdk_env.sh
# Rust environment 
# [[ -r ~/.cargo/env ]] && source ~/.cargo/env
# opam configuration
# test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# ocaml environment 
eval $(opam env)

### DEVELOPMENT PATH (environment) ###

#### LOG ####
export NVIM_COC_LOG_FILE="$HOME/log/nvim.coc.log"
export NVIM_PYTHON_LOG_FILE="$HOME/log/nvim.python.log"
export XDG_RUNTIME_DIR="$HOME/log/xdg"
#### LOG ####

#### SOURCE ###
source $HOME/.aliases
source $HOME/.zshrc.local
#### SOURCE ###

# fnm
export PATH=/home/r177/.fnm/:$PATH
eval "`fnm env`"
