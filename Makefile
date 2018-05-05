DIRECTORY = ~/dev/dotfiles

git:
	ln -fsn $(DIRECTORY)/git/gitconfig ~/.gitconfig

curl:
	sudo apt install openssl ca-certificates
	sudo apt install curl

vim:
	ln -fsn $(DIRECTORY)/vim/.vimrc ~/.vimrc
	mkdir -p ~/.vim/autoload
	ln -fsn $(DIRECTORY)/vim/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
	# Plugins
	ln -fsn $(DIRECTORY)/vim/bundle ~/.vim/bundle

fzf:
	ln -fsn $(DIRECTORY)/fzf ~/.fzf
	~/.fzf/install

zsh:
	ln -fsn $(DIRECTORY)/zsh/oh-my-zsh ~/.oh-my-zsh
	~/.oh-my-zsh/tools/install.sh
	ln -fsn $(DIRECTORY)/zsh/.zshrc ~/.zshrc
	# Spaceship Theme
	ln -fsn $(DIRECTORY)/zsh/themes/shpaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	sudo chsh -s $(which zsh)

setup:
	git submodule init
	git submodule update

all: git setup curl vim fzf zsh

.PHONY: all git setup curl vim fzf zsh
