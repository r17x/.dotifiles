""""""""""""""""""""""""""""""""""""""""
"""" @ri7nz <ri7nz.labs@gmail.com> """""
""""""""""""""""""""""""""""""""""""""""

set encoding=utf8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ReasonML
Plug 'jordwalke/vim-reasonml'
Plug 'reasonml-editor/vim-reason-plus'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:python3_host_prog = "/usr/bin/python3.7" 


" Dash Documentation
Plug 'rizzatti/dash.vim'

" NERDTreeToggle 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dsimidzija/vim-nerdtree-ignore'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gilsondev/searchtasks.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'majutsushi/tagbar'
" Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'yardnsm/vim-import-cost', {'do': 'yarn install'}

" Communicate with tmux
Plug 'benmills/vimux' 
Plug 'tyewang/vimux-jest-test'

" Tracking
Plug 'wakatime/vim-wakatime'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

" Theme / Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/Colorizer'

" Icon
Plug 'ryanoasis/vim-devicons'

" Generic Programming Support Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko/vim-test'

" Lint
Plug 'dense-analysis/ale'

" Javascript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'trkw/yarn.vim'

call plug#end()

source ~/.vimrc.common
source ~/.vimrc.theme
source ~/.vimrc.fzf
source ~/.vimrc.ale
source ~/.vimrc.mapping
source ~/.vimrc.coc
source ~/.vimrc.javascript 
source ~/.vimrc.nerdtree 
source ~/.vimrc.reasonml 
source ~/.vimrc.lsp
