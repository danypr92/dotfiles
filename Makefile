git:
	ln -fsn $(PWD)/git/gitconfig ~/.gitconfig

curl:
	sudo apt install openssl ca-certificates
	sudo apt install curl
vim:
	ln -fsn $(PWD)/vim/.vimrc ~/.vimrc
	mkdir -p ~/.vim/autoload
	ln -fsn $(PWD)/vim/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
	# Plugins
	ln -fsn $(PWD)/vim/bundle ~/.vim/bundle

fzf:
	ln -fsn $(PWD)/fzf ~/.fzf
	~/.fzf/install

zsh:
	ln -fsn $(PWD)/zsh/oh-my-zsh ~/.oh-my-zsh
	~/.oh-my-zsh/tools/install.sh
	ln -fsn $(PWD)/zsh/.zshrc ~/.zshrc
	# Spaceship Theme
	ln -fsn $(PWD)/zsh/themes/shpaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	sudo chsh -s $(which zsh)

setup:
	git submodule init
	git submodule update

all: git setup curl vim fzf zsh

.PHONY: all
