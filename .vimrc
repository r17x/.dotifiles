set encoding=utf8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug: auto install or self manage of vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
" @usage
" call s:InitPluginManager()
" @return {string} plugged path
"
" autoload vim-plug 
"""
func! s:InitPluginManager()
  if has('nvim')
    let l:vim_plug_file = stdpath('data') . '/site/autoload/plug.vim'
  else
    let l:vim_plug_file = '~/.vim/autoload/plug.vim'
  endif
  " when vim-plug aka {plug.vim} NOT exist in autoload path
  " download file from {https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}
  if empty(glob(vim_plug_file))
      echo "installing vim-plug..."
      let l:vim_plug_raw = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      silent! execute "!curl -fLo " .vim_plug_file. " --create-dirs " . vim_plug_raw
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
      echo "vim-plug installed!"
  endif
endfunc
" call InitPluginManager only for this file
call s:InitPluginManager()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim plugins list
" 
" vim-plug: add your plugin after `call plug#begin(...)`
"
" mostly plugin hosted in github/<username|organization_name>/plugin-name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" it will decrypt your encrypted file (.gpg, .pgp, & .asc)
"
" @example
"
" ```shell
" vim mysecretmessage.gpg 
" ```
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'jamessan/vim-gnupg'
" commentary
" gcc to comment out a line (takes a count)
" gc to comment out the target of a motion
Plug 'tpope/vim-commentary'
" Diagram / Draw
Plug 'gyim/vim-boxdraw'
Plug 'vim-scripts/DrawIt'
" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" syntax for rc or configuration file 
Plug 'weakish/rcshell.vim'
if !empty(glob("/usr/bin/pypy3"))
    " uncomment when stable pypy3 in big surp
    " let g:python3_host_prog = "/usr/bin/pypy3" "
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlight for "all" language
Plug 'sheerun/vim-polyglot' 
" fzf integration in vim 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usability:
" * fzf (fuzzy-finder)
" * nerdtree (file system explorer)
" * nerdtree-ignore (hidden files for ignored file. e.g: node_modules)
" * nerdtree-git-plugin (integration with state of git. e.g:
"     unstage,stage,modify)
" * searchtasks (find TODO, FIXME in file)
" * tagbar (REQUIRED ctags)
" * dispatch (make async for system command) 
" * vimux (integration with tmux)
" * wakatime (tracking your coding activity)
" * git-log
" * gitv
" * fugitive
" * gitgutter
" * conflicted
" * vimagit
" * easymotion
" * incsearch
" * incsearch-easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree',  { 'on': 'NERDTreeToggle' }
Plug 'dsimidzija/vim-nerdtree-ignore',  { 'on': 'NERDTreeToggle' } 
Plug 'Xuyuanp/nerdtree-git-plugin' ,  { 'on': 'NERDTreeToggle' } 
Plug 'gilsondev/searchtasks.vim', {'on': 'SearchTasks' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle' }
Plug 'tpope/vim-dispatch'
Plug 'benmills/vimux' 
Plug 'wakatime/vim-wakatime'
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'jreybert/vimagit'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" Mustache lang
Plug 'juvenn/mustache.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Writing:
" * vim-markdown-toc (generate Table Of Content)
" * vim-pencil
" * vim-flavored-markdown (preview in vim window for markdown content)
" * focus: goyo
" * focus: limelight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mzlogin/vim-markdown-toc'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'itchyny/lightline.vim'
" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme:
" * onedark
" * edge
" * vim-devicons (emoji and icon support)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ri7nz/vim-one'
Plug 'sainnhe/edge'
Plug 'ryanoasis/vim-devicons'
" OpenAPI
" Need `pip install --user openapi-spec-validator`
Plug 'srivathsanmurali/OpenAPIValidate.vim'
Plug 'hsanson/vim-openapi'
Plug 'xavierchow/vim-swagger-preview'
" HTTP 
Plug 'nicwest/vim-http'
" GQL
Plug 'jparise/vim-graphql'
" ReScript
Plug 'rescript-lang/vim-rescript'
Plug 'arp242/startscreen.vim'
" Map popup
Plug 'liuchengxu/vim-which-key'
call plug#end()

function! BringMeTheVIM()
    read ~/.vim/vimrc.d/amoscreen.bmth
    " Some margin for readability
    :silent %>>
    " Go to line 1
    :1
endfun

let g:Startscreen_function = function('BringMeTheVIM')
let g:nv_search_paths = [
   \'~/wikis', 
   \'README.md' , 
   \'~/evl/rin.rocks/content'
\]

" source vim configuration from ~/.vim/vimrc.d/
for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

if filereadable("~/.cache/calendar.vim/credentials.vim")
    source ~/.cache/calendar.vim/credentials.vim
endif

if has('nvim')
  set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
  let &packpath = &runtimepath
endif
