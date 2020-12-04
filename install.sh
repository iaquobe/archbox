#!/bin/bash



SCRIPTPATH=$(dirname $(realpath $0))

# set symbolic links
ln -s "$SCRIPTPATH/vimb"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/nvim"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/zathura"	$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/sxhkd"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/bspwm"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/dunst"		$XDG_CONFIG_HOME
ln -s "$SCRIPTPATH/compton"	$XDG_CONFIG_HOME

# install zsh syntax highligithing
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" $SCRIPTPATH/zsh/zsh-syntax-highlighting
