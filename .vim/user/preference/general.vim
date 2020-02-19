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


"##############
"#   themes   #
"##############
colorscheme zenburn
set t_Co=256
set hlsearch
set nu
set laststatus=2
autocmd ColorScheme * highlight Normal ctermbg=None
