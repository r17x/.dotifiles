"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
" imap => insert mode 
" nmap => normal mode 
"
" <Space/> is our Leader 😎
"""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let mapleader = ' '
"""""""""""""""""""""""""""""""""""""
" mapping with Leader
"""""""""""""""""""""""""""""""""""""
" Copy & paste to system clipboard with {<Space> + p} and {<Space> + y}
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Type {<Space> + n} for open zsh configuration
nnoremap <Leader>n :NERDTreeToggle<CR>
" Type {<Space> + m} for open zsh configuration
nnoremap <Leader>m :TagbarToggle<CR>
" Enter visual line mode with {<Space><Space>}
nmap <Leader><Leader> V
" Type {<Space> + o} for search file content (FZF)
nnoremap <Leader>o :Files<CR> 
" Type {<Space> + O} for search file content with RipGrep (FZF)
nnoremap <Leader>O :Rg<CR>
" Type {<Space> + q} for writing and quit current file
nnoremap <Leader>q :wq<CR>
" Type {<Space> + w} for writing current file
nnoremap <Leader>w :w<CR>
" Type {<Space> + f} for formatting current file when
" language server was integrated
nnoremap <Leader>f :Format<CR> 
" Type {<Space> + sc} for source current file
nnoremap <Leader>rc :source %<CR>
" Type {<Space> + rc} for reload vim configuration
nnoremap <Leader>rc :source $MYVIMRC<CR>
" Type {<Space> + oc} for open vim configuration
nnoremap <Leader>oc :vnew ~/.vimrc<CR>
" Type {<Space> + oz} for open zsh configuration
nnoremap <Leader>oz :vnew ~/.zshrc<CR>
" Type {<Space> + om} for open zsh configuration
nnoremap <Leader>om :vnew ~/.vim/vimrc.d/__99mappin9.vim<CR>
" Type {<Space> + oz} for open zsh configuration template
nnoremap <Leader>ozt :vnew ~/.zshrc\#\#template<CR>
" Type {<Space> + cr} for restart coc.nvim
nnoremap <Leader>cr :CocRestart<CR>
" Type {<Space> + G} for Git file list
noremap <Leader>G :Git<CR>
" Type {<Space> + gf} for browse tracked git files in vim
noremap <Leader>gf :GFiles<CR> 
" Type {<Space> + gsp} for buffer(window) split 
noremap <Leader>gsp :Gsplit<CR> 
" Type {<Space> + gds} for split window and Git diff current file
noremap <Leader>gds :Gdiffsplit<CR> 
" Type {<Space> + gll} for Git log
noremap <Leader>gll :Glog<CR>
" Type {<Space> + gfa} for Git fetch all
noremap <Leader>gfa :Git fetch --all<CR>
" Type {<Space> + gs} for showing Git Status
noremap <Leader>gs :Gstatus<CR>
" Type {<Space> + gps} for executed Git Push 
noremap <Leader>gps :Gpush<CR>
" Type {<Space> + gpl} for executed Git Pull
noremap <Leader>gpl :Gpull<CR>
" Type {<Space> + gw} for Git Add/Write
noremap <Leader>gw :Gwrite<CR> 
" Type {<Space> + gcm} for Git commit
noremap <Leader>gcm :Gcommit<CR>
" Type {<Space> + gmt} for Git mergetool
noremap <Leader>gmt :Git mergetool<CR>
" Type {<Space> + gnc} for git next conflicted (vim-conflicted)
noremap <Leader>gnc :GitNextConflict<CR>
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mac User Map HJKL
imap ˙ <Left>
imap ∆ <Down>
imap ˚ <Up>
imap ¬ <Right>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ;; :w<CR>
nmap ;: :wq<CR>
nmap :W :w<CR>
nmap :Q :q<CR>
nmap :Q! :q!<CR>
nmap :WQ :wq<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping with CTRL (Control)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Type {CTRL + p} for browse file (FZF)
map <C-p> :Files<CR>
" Type {CTRL + n}
" left side bar for browse files
map <C-n> :NERDTreeToggle<CR> 
" Type {CTRL + m}
" right side bar for definition of your code
" map <C-m> :TagbarToggle<CR>
" Type {Ctrl+h} for navigated to left
noremap <C-h> <C-w>h
" Type {Ctrl+j} for navigated to bottom
noremap <C-j> <C-w>j
" Type {Ctrl+k} for navigated to up
noremap <C-k> <C-w>k
" Type {Ctrl+l} for navigated to right
noremap <C-l> <C-w>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow movement, resize splits instead.
" <- : for resize(+2) to left
" -> : for resize(+2) to righ
"  V : for resize(+2) to bottom
"  ^ : for resize(+2) to up
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif
" auto insert datetime
map <F3> :r !date --rfc-3339=s<cr>
" Use `gl` and `gu` rather than the default conflicted diffget mappings
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
" Discover text search object
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" Automatically jump to end of text you pasted:
" I can paste multiple lines multiple times with simple {ppppp}.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Prevent replacing paste buffer on paste
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" Type 12<Enter> to go to line 12
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
nnoremap <CR> G
nnoremap <BS> gg
