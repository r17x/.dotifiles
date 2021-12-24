#
# ~/.bashrc
#
### Machine portable detect ###
getMachine () {
    local unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     local machine=linux;;
        Darwin*)    local machine=darwin;;
        CYGWIN*)    local machine=cygwin;;
        MINGW*)     local machine=minGw;;
        *)          local machine="UNKNOWN:${unameOut}"
    esac
    echo "$machine"
}
isMachine () {
  if [ $(getMachine) = $1 ];then
    return 0;
  fi
  return 1;
}
### Machine portable detect ###
TERM=screen-256color
if isMachine "linux"; then
# If not running interactively, don't do anything
    [[ $- != *i* ]] && return
    
    PS1='[\u@\h \W]\$ '
    
    
    if [ "$TERM" = "xterm" ]; then
        echo "XXX"
        export TERM=xterm-256color
    fi 
fi

export GPG_TTY=$(tty) 

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
if [ -e /Users/r17/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/r17/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
