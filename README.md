# My Vim Config

![screenshot](screenshot.png)

## Installation

Includes:

* Vim v8.2.0012

* Exuberant Ctags 5.8

* GNU GLOBAL 6.3.3

```bash
git clone https://github.com/chestercheng/myvim.git
cd myvim && make all
```

## File Structure

```
.
├── .vim
│   ├── dein
│   │   ├── .cache
│   │   └── repos
│   │       └── github.com
│   │           ├── Shougo
│   │           │   └── dein.vim
│   │           └── ...
│   └── user
│       ├── ftplugin
│       │   ├── default.vim
│       │   ├── python.vim
│       │   └── ...
│       ├── preference
│       │   ├── general.vim
│       │   └── ...
│       └── repos
│           └── markdown-preview
├── .vimrc
├── Makefile
└── README.md
```
## Plugins Management

[dein.vim](https://github.com/Shougo/dein.vim) - Dark powered Vim/Neovim plugin manager

Usage:

> Run command at Vim (command mode).

* Update plugins

    ```
    :call dein#update()
    ```

* Remove the disabled plugins

    ```
    call map(dein#check_clean(), "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
    ```

## Plugins

* [djoshea/vim-autoread](https://github.com/djoshea/vim-autoread) - Have Vim automatically reload a file that has changed externally

* [dracula/vim](https://github.com/dracula/vim) - Dark theme for Vim https://draculatheme.com/vim

* [ekalinin/Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim) - Vim syntax file & snippets for Docker's Dockerfile

* [ervandew/supertab](https://github.com/ervandew/supertab) - Perform all your vim insert mode completions with Tab

* [hashivim/vim-terraform](https://github.com/hashivim/vim-terraform) - basic vim/terraform integration

* [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim) - All the world's indeed a stage and we are merely players

* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align) - A Vim alignment plugin

* [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) - A Vim plugin that manages your tag files https://bolt80.com/gutentags/

* [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multiple cursors plugin for vim/neovim

* [othree/eregex.vim](https://github.com/othree/eregex.vim) - Perl/Ruby style regexp notation for Vim

* [preservim/nerdcommenter](https://github.com/preservim/nerdcommenter) - Vim plugin for intensely nerdy commenting powers

* [preservim/nerdtree](https://github.com/preservim/nerdtree) - A tree explorer plugin for vim

* [skywind3000/gutentags_plus](https://github.com/skywind3000/gutentags_plus) - The right way to use gtags with gutentags

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - fugitive.vim: A Git wrapper so awesome, it should be illegal

* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) - lean & mean status/tabline for vim that's light as air

* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) - A collection of themes for vim-airline
