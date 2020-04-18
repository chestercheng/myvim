"##############
"# preference #
"##############
set encoding=utf-8
set fileformat=unix
set autoindent
set noswapfile
set mouse=a
" make backspace work like most other apps
set backspace=2
" use system clipboard
set clipboard=unnamed
" trim trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e
" all folds open when opening a file
set foldmethod=syntax
set foldlevel=46


"##############
"#   themes   #
"##############
let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula
set t_Co=256
set hlsearch
set nu
set laststatus=2
