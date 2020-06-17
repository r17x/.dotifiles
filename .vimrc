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
" Plug 'jordwalke/vim-reasonml'
Plug 'reasonml-editor/vim-reason-plus'

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

Plug 'Shougo/deoplete.nvim'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'alok/notational-fzf-vim'
let g:nv_search_paths = ['~/wiki', '~/writing', 'docs.md' , './notes.md']
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
Plug 'preservim/nerdcommenter'
" Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'yardnsm/vim-import-cost', {'do': 'yarn install'}

" Communicate with tmux
Plug 'benmills/vimux' 
Plug 'tyewang/vimux-jest-test'

" Integration Services
Plug 'wakatime/vim-wakatime'
Plug 'ananagame/vimsence'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'

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
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': [
            \ 'javascript', 'typescript', 'css', 
            \ 'less', 'scss', 'json', 'graphql', 
            \ 'markdown', 'vue', 'yaml', 
            \ 'html'] }


""" NEED TO TRY
" junegunn/vim-easy-align
" Plug 'itchyny/lightline.vim'
" Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
""" 
call plug#end()
" essential & common configuration
source ~/.vimrc.common
" LanguageServer configuration  
" source ~/.vimrc.lsp
source ~/.vimrc.reasonml 
" theme & fancy configuration
source ~/.vimrc.theme
" fuzzy finder
source ~/.vimrc.fzf
" asynchronous lint engine
source ~/.vimrc.ale
" keyboard mapping configuration
source ~/.vimrc.mapping
" COC/Intelisense
source ~/.vimrc.coc
" Javascript
source ~/.vimrc.javascript 
" SideBar for file finder
source ~/.vimrc.nerdtree 
" Vim function
source ~/.vimrc.fun
" EasyMotion
source ~/.vimrc.easymotion
let g:vimspector_enable_mappings = 'HUMAN'


" if exists("b:current_syntax")
"     finish
" endif
" 
" 
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" 
" let b:current_syntax = "todo"
" 
" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE
" 
" setlocal cole=1

" Custom conceal
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=

hi def link todoCheckbox Todo

highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

setlocal cole=1
call matchadd('Conceal', '\[\ \]', 0, 11, {'conceal': ''})
call matchadd('Conceal', '\[x\]', 0, 12, {'conceal': ''})
