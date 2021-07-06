#!/bin/bash



SCRIPTPATH=$(dirname $(realpath $0))

# set symbolic links
ln -s "$SCRIPTPATH/sxhkd"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/bspwm"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/dunst"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/compton"		$XDG_CONFIG_HOME

ln -s "$SCRIPTPATH/polybar"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/rofi"			$XDG_CONFIG_HOME

mkdir $XDG_CONFIG_HOME/zsh
ln -s "$SCRIPTPATH/zsh/.zshrc"	$XDG_CONFIG_HOME/zsh
ln -s "$SCRIPTPATH/nvim"			$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/zathura"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/alacritty"		$XDG_CONFIG_HOME

ln -s "$SCRIPTPATH/.xbindkeys"	~
ln -s "$SCRIPTPATH/.xinitrc"		~
ln -s "$SCRIPTPATH/.zshenv"		~
ln -s "$SCRIPTPATH/.inputrc"		~
ln -s "$SCRIPTPATH/scripts"		~

# install zsh syntax highligithing
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" $SCRIPTPATH/zsh/zsh-syntax-highlighting
