if &compatible
  set nocompatible " Be iMproved
endif

" Required
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

  " Let dein manage dein
  call dein#add('$HOME/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add plugins
  call dein#add('$HOME/.vim/user/repos/markdown-preview', {'on_ft': 'markdown'})
  call dein#add('$HOME/.vim/user/repos/vim-moonfly-statusline')
  call dein#add('djoshea/vim-autoread')
  call dein#add('ekalinin/Dockerfile.vim', {'on_ft': 'dockerfile'})
  call dein#add('ervandew/supertab')
  call dein#add('junegunn/limelight.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('mg979/vim-visual-multi')
  call dein#add('othree/eregex.vim')
  call dein#add('preservim/nerdtree')
  call dein#add('skywind3000/gutentags_plus')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/caw.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Load other vim script
runtime! user/preference/*.vim
runtime! user/ftplugin/*.vim
