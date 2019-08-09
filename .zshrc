# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=darwin;;
    CYGWIN*)    machine=cygwin;;
    MINGW*)     machine=minGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Path to your oh-my-zsh installation.

# this function only check for not directory exist.
export ZSH=~/.oh-my-zsh
export ZPLUG_HOME=~/.zplug

if [ ! -d "$ZSH" ];then
    echo "Installing oh-my-zsh in $ZSH"
    curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh
fi

if [  ! -d "$ZPLUG_HOME" ] && [ -f "$ZSH/oh-my-zsh.sh"  ];then
    echo "Installing zplug in $ZPLUG_HOME"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="zeit"
# ZSH_THEME="geometry/geometry"

plugins=(
  emoji-clock
  emoji
  brew
  colorize
  git
  gitfast
  github
  yarn
  python
  iterm2
)

source $ZSH/oh-my-zsh.sh
# source $ZSH/themes/geometry/geometry.zsh
# zsh-plug init 
source $ZPLUG_HOME/init.zsh
# zsh-plugin
#
zplug "geometry-zsh/geometry"
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug load --verbose

# zsh-plug geometry configuration 
GEOMETRY_PROMPT_PLUGINS=(virtualenv docker_machine exec_time git)
GEOMETRY_COLOR_GIT_DIRTY=9
GEOMETRY_COLOR_GIT_BRANCH=6
GEOMETRY_COLOR_EXIT_VALUE=9
GEOMETRY_SYMBOL_EXIT_VALUE="▲"
PROMPT_GEOMETRY_GIT_CONFLICTS=true
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
PROMPT_GEOMETRY_RPROMPT_ASYNC=true
PROMPT_GEOMETRY_COMMAND_MAX_EXEC_TIME=true

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# [React-Native] Android Configuration
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export ANDROID_NDK=$ANDROID_HOME/ndk-bundle

if [ ! -d "$ANDROID_HOME" ];then
    echo "Download ANDROID SDK & NDK"
    curl -o /tmp/sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-$machine-4333796.zip && unzip -d /tmp/sdk-tools.zip $ANDROID_HOME
    curl -o /tmp/ndk-bundle.zip https://dl.google.com/android/repository/android-ndk-r20-$machine-x86_64.zip && unzip -d /tmp/ndk-bundle.zip $ANDROID_NDK
fi

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias cat=bat
alias gf="git flow"
alias gl="git log --graph --oneline --all"
alias gll="git log --oneline --decorate --all --graph --stat"
alias gld="git log --oneline --all --pretty=format:\"%h%x09%an%x09%ad%x09%s\""

# Node Version Management
# https://github.com/nvm-sh/nvm/blob/v0.34.0/install.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export HERMES_WS_DIR=$HOME/.hermes
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=$HERMES_WS_DIR/build/bin:$PATH

export GPG_TTY=$(tty)
export EDITOR=vim

# direnv [Python Environment] 
eval "$(direnv hook zsh)"
# ctags
ctags=/usr/local/bin/ctags

# java_home /usr/libexec/java_home -v x.x
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

nvm use --delete-prefix v10.15.3 --silent
