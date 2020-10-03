#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


if [ "$TERM" = "xterm" ]; then
    export TERM=xterm-256color
fi 
