
fun! Start()
  enew
  exec ":r !cat ~/.kaisen"
  setlocal
    \ bufhidden=wipe
    \ buftype=nofile
    \ nobuflisted
    \ nocursorcolumn
    \ nocursorline
    \ nolist
    \ nonumber
    \ noswapfile
    \ norelativenumber

  setlocal
    \ nomodifiable
    \ nomodified

  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> o :enew <bar> startinsert<CR>

endfun

if argc() == 0
  autocmd VimEnter * call Start()
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'terryma/vim-expand-region'
Plug 'rstacruz/vim-closer'
Plug 'dense-analysis/ale'
Plug 'vimsence/vimsence'
Plug 'tpope/vim-commentary'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'cormacrelf/vim-colors-github'
Plug 'dylanaraps/wal'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
Plug 'makerj/vim-pdf'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tmsvg/pear-tree'
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }
let g:pear_tree_ft_disabled = []

let g:pear_tree_repeatable_expand = 1

let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

let g:pear_tree_timeout = 60

let g:pear_tree_map_special_keys = 1

imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
call plug#end()

runtime ftplugin/man.vim
colorscheme wal

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
"nnoremap d dd
cnoreabbrev q qa
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap H 0
nnoremap L A
nnoremap j gj
nnoremap k gk
"nnoremap x dd
nnoremap g= mvgg=G`g
noremap ; :
vmap <BS> <gv
vmap <TAB> >gv
xnoremap p pgvy

set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set undofile
set undolevels=1000
set undoreload=1000
set breakindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set noswapfile
set backupdir=~/.config/vim/tmp/backups/
set undodir=~/.config/vim/tmp/undo/
set synmaxcol=150
set keywordprg=:Man
set fillchars+=eob:\

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

augroup bacon
     au FileType man nnoremap <buffer> K :bd<cr>
     au BufWritePre [:;]* throw 'Forbidden file name: ' . expand('<afile>')
     au BufWritePre * :%s/\s\+$//e
     au BufEnter *.txt  setlocal colorcolumn=80 virtualedit=all
     au BufEnter *.txt  highlight ColorColumn ctermbg=1 guibg=red
augroup END

set signcolumn=yes
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:python_host_skip_check = 1
