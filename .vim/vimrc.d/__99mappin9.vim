"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
" imap => insert mode 
" nmap => normal mode 
"""""""""""""""""""""""""""""""""""""
let mapleader = ','

"" CTRL + P  (required: fzf for preview)
map <C-p> :Files<CR>
"" CTRL + [
" map <C-;> :Rg<CR>
"" CTRL + n 
  map <C-n> :NERDTreeToggle<CR> 
"" CTRL + m 
  map <C-m> :TagbarToggle<CR>

imap ;; <Esc>
imap ii <Esc>
nmap ;; :w<CR>
nmap ;: :wq<CR>
nmap :W :w<CR>
nmap :Q :q<CR>
nmap :Q! :q!<CR>
nmap :WQ :wq<CR>

" Git file list
noremap <leader>G :Git<CR>
" Browser file in vim
noremap <leader>gf :GFiles<CR> 
" Git split 
noremap <leader>gsp :Gsplit<CR> 
" Git diff
noremap <leader>gds :Gdiffsplit<CR> 
" Git log
noremap <leader>gll :Glog<CR>
" Git fetch all
noremap <leader>gfa :Git fetch --all<CR>
" Git Status
noremap <leader>gs :Gstatus<CR>
" Git Push 
noremap <leader>gps :Gpush<CR>
" Git Pull
noremap <leader>gpl :Gpull<CR>
" Git Add/Write
noremap <leader>gw :Gwrite<CR> 
" Git commit
noremap <leader>gcm :Gcommit<CR>
" Git mergetool
noremap <leader>gmt :Git mergetool<CR>
" vim-conflicted
noremap <leader>gnc :GitNextConflict<CR>
" Use `gl` and `gu` rather than the default conflicted diffget mappings
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'

"" Mac User Map HJKL
imap ˙ <Left>
imap ∆ <Down>
imap ˚ <Up>
imap ¬ <Right>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Shortcuts
nnoremap <Leader>o :Files<CR> 
nnoremap <Leader>O :Rg<CR>
nnoremap <Leader>w :w<CR>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" <TAB> deoplete
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" autozimu/LanguageClient-neovim
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <silent> <CR> :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" auto insert datetime
map <F3> :r !date --rfc-3339=s<cr>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
