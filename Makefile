DIRECTORY = ~/dev/dotfiles

git:
	ln -fsn $(DIRECTORY)/git/gitconfig ~/.gitconfig

curl:
	sudo apt install openssl ca-certificates
	sudo apt install curl

neovim:
	mkdir -p ~/.config/nvim/
	ln -fsn $(DIRECTORY)/neovim/init.vim ~/.config/nvim/init.vim

vim:
	mkdir -p ~/.vim
	ln -fsn $(DIRECTORY)/vim/vimrc ~/.vimrc
	ln -fsn $(DIRECTORY)/vim/pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim
	ln -fsn $(DIRECTORY)/vim/bundle ~/.vim/bundle
	ln -fsn $(DIRECTORY)/vim/colors ~/.vim/colors

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

i3:
	ln -fsn $(DIRECTORY)/i3/ ~/.i3

aliases:
	ln -fsn $(DIRECTORY)/aliases ~/.aliases

setup:
	git submodule init
	git submodule update

all: i3 git setup curl neovim vim fzf zsh

.PHONY: all i3 git setup curl neovim vim fzf zsh
