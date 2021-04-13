eval $(/opt/homebrew/bin/brew shellenv)
test -e "${HOME}/.iterm2_shell_integration.zsh" \
    && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/opt/homebrew/opt/luajit-openresty/bin:$PATH"
