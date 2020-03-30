" moving vimrc enables vi compatibility. Disable it here.
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filesystem
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't make backups
set nobackup
set nowritebackup

" Persistent undo
set undofile
set undodir=$XDG_CACHE_HOME/vim/undo

" Don't use swap files, autoreload when file has changed on disk
set noswapfile
set autoread
au BufEnter,FocusGained * checktime

" file locations
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim
    \,$XDG_CONFIG_HOME/vim/after
    \,$VIM
    \,$VIMRUNTIME
    \,/usr/share/vim/vimfiles
let $MYVIMRC='$XDG_CONFIG_HOME/vim/vimrc'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4


" disable modelines, for absolute control
set nomodeline

" line numbers
set relativenumber
set number

" Status Line
set laststatus=2
set statusline=%<                    " truncate at beginning
set statusline+=%f                   " filename
set statusline+=\ (%{&ft})           " filetype
set statusline+=\ %-4(%m%)           " modified status, padded to 4 on the left
set statusline+=%=                   " right justify after splitter
set statusline+=%-19(%3l,%02c%03V%)  " line number, row, row with expanded tabs


" syntax highlighting
filetype plugin on
syntax on

" hardcode odd file extensions
autocmd BufNewFile,BufRead *.zshenv set syntax=zsh

" search settings
set showmatch  " live match highlighting
set hlsearch  " highlight searches

" tab, trailing white space, non breaking space, end of line, line continuation
set list listchars=tab:│\ ,trail:·,nbsp:·,eol:¬,precedes:«,extends:»

" gruvbox color scheme
set termguicolors
" for tmux ???
let &t_8f="[38;2;%lu;%lu;%lum"
let &t_8b="[48;2;%lu;%lu;%lum"
let g:gruvbox_italic=1
colorscheme gruvbox

" smart line breaking
set linebreak

" spell checking
set spell

" do not spell check words that are all capitals
syn match AcronymNoSpell '\<\(\u\|\d\)\{2,}s\?\>' contains=@NoSpell

" do not complain about lower case in git commits
autocmd FileType gitcommit setlocal spellcapcheck=

" have yanking use system clipboard
set clipboard=unnamedplus

" save position in file
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Netrw supports reading and writing across networks. Disable it.
let g:netrw_dirhistmax = 0

" bind Ctrl-j and Ctrl-k to previous and next error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ALE sign gutter popping in and out is too much movement
let g:ale_sign_column_always = 1

" do not complain about missing stub files
let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_fixers = {
    \ 'sql': ['pgformatter'],
    \ }

let g:ale_sql_pgformatter_options = '-w 80'

" Use bash for shell commands
set shell=/usr/bin/bash
let $BASH_ENV = "$XDG_CONFIG_HOME/bash_aliases"

" w!! overwrites write protected file
command W execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" textwidth of 72 for mutt emails
au BufRead /tmp/mutt-* set tw=72

set secure
