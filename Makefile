SHELL := bash

PREFIX ?= /usr/local


all: gtags vim vimrc


CTAGS_VERSION ?= 5.8
CTAGS_SRC = http://prdownloads.sourceforge.net/ctags/ctags-$(CTAGS_VERSION).tar.gz
ctags: $(PREFIX)/bin/ctags
$(PREFIX)/bin/ctags:
	curl -SL "$(CTAGS_SRC)" | tar -zx -C /tmp
	$(eval src = /tmp/ctags-$(CTAGS_VERSION))
	cd $(src) && \
		./configure --prefix=$(PREFIX) --enable-macro-patterns --with-readlib && \
		make && make install
	rm -rf $(src)


GTAGS_VERSION ?= 6.3.3
GTAGS_SRC = https://ftp.gnu.org/pub/gnu/global/global-$(GTAGS_VERSION).tar.gz
gtags: ctags $(PREFIX)/bin/gtags
$(PREFIX)/bin/gtags:
	curl -SL "$(GTAGS_SRC)" | tar -zx -C /tmp
	$(eval src = /tmp/global-$(GTAGS_VERSION))
	cd $(src) && \
		./configure --prefix=$(PREFIX) --with-exuberant-ctags=$(PREFIX)/bin/ctags && \
		make && make install
	rm -rf $(src)


VIM_VERSION ?= v8.2.0012
VIMRUNTIMEDIR ?= $(PREFIX)/share/vim/vim82
vim: $(PREFIX)/bin/vim
$(PREFIX)/bin/vim:
	$(eval src = /tmp/vim)
	git clone https://github.com/vim/vim.git $(src)
	cd $(src) && \
		git checkout $(VIM_VERSION) && \
		./configure --with-features=huge --enable-multibyte \
			--enable-rubyinterp=yes --enable-pythoninterp=yes \
			--enable-python3interp=yes --enable-perlinterp=yes \
			--enable-luainterp=yes --enable-cscope --prefix=$(PREFIX) && \
		make VIMRUNTIMEDIR="$(VIMRUNTIMEDIR)" && \
		make install
	rm -rf $(src)


DEIN_INSTALLER ?= https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
vimrc:
	ln -sf $(PWD)/.vimrc $(HOME)/.vimrc
	ln -sf $(PWD)/.vim $(HOME)
	curl -sL $(DEIN_INSTALLER) | bash -s $(HOME)/.vim/dein
