#!/bin/bash
XDG_CONFIG_HOME=~/.config

packages=( git bspwm dunst polybar rofi feh neovim xrandr texlive npm sxiv xrandr xbindkeys xvkbd )
sudo dnf install $packages



SCRIPTPATH=$(dirname $(realpath $0))

# set symbolic links
ln -s "$SCRIPTPATH/sxhkd"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/bspwm"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/dunst"			$XDG_CONFIG_HOME

ln -s "$SCRIPTPATH/polybar"		$XDG_CONFIG_HOME
mkdir ~/.local/share/fonts
cp "$SCRIPTPATH/polybar/feather.ttf"		~/.local/share/fonts/feather.ttf
ln -s "$SCRIPTPATH/rofi"			$XDG_CONFIG_HOME

ln -s "$SCRIPTPATH/zsh/"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/nvim"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/zathura"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/alacritty"		$XDG_CONFIG_HOME

ln -s "$SCRIPTPATH/.xbindkeysrc"	~
ln -s "$SCRIPTPATH/.xinitrc"		~
ln -s "$SCRIPTPATH/.zshenv"		~
ln -s "$SCRIPTPATH/.inputrc"		~
ln -s "$SCRIPTPATH/scripts"		~

ln -s "$SCRIPTPATH/wallpapers"	~/Pictures/

# install zsh syntax highligithing
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" $SCRIPTPATH/zsh/zsh-syntax-highlighting


# install vim stuff
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c PlugInstall -c "CocInstall coc-python coc-clangd coc-html coc-texlab coc-sh"

