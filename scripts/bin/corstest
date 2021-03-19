#!/bin/bash
# WF 2018-09-20
# https://stackoverflow.com/a/47609921/1497139

#ansi colors
#http://www.csc.uvic.ca/~sae/seng265/fall04/tips/s265s047-tips/bash-using-colors.html
blue='\033[0;34m'  
red='\033[0;31m'  
green='\033[0;32m' # '\e[1;32m' is too bright for white bg.
endColor='\033[0m'

#
# a colored message 
#   params:
#     1: l_color - the color of the message
#     2: l_msg - the message to display
#
color_msg() {
  local l_color="$1"
  local l_msg="$2"
  echo -e "${l_color}$l_msg${endColor}"
}


#
# show the usage
#
usage() {
  echo "usage: [-v] $0 url"
  echo "  -v |--verbose: show curl result" 
  exit 1 
}

if [ $# -lt 1 ]
then
  usage
fi

# commandline option
while [  "$1" != ""  ]
do
  url=$1
  shift

  # optionally show usage
  case $url in      
    -v|--verbose)
       verbose=true;
       ;;          
  esac
done  


if [ "$verbose" = "true" ]
then
  curl -s -X GET $url -H 'Cache-Control: no-cache' --head 
fi
origin=$(curl -s -X GET $url -H 'Cache-Control: no-cache' --head | grep -i access-control)


if [ $? -eq 0 ]
then
  color_msg $green "$url $origin"
else
  color_msg $red "$url does not support CORS"
  color_msg $blue "you might want to visit https://enable-cors.org/ to find out how to enable CORS"
fi
