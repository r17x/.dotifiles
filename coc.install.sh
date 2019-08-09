#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
# for neovim
# mkdir -p ~/.local/share/nvim/site/pack/coc/start
# cd ~/.local/share/nvim/site/pack/coc/start
# curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
yarn add coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
