#!/bin/bash

echo "is this script in your workig dir [y/n]"
read response
if [ "$response" != y ]; then
	echo "then make sure it is"
	exit
fi

ln -s "$(pwd)/vimb" $XDG_CONFIG_HOME
ln -s "$(pwd)/nvim" $XDG_CONFIG_HOME
ln -s "$(pwd)/zathura" $XDG_CONFIG_HOME
ln -s "$(pwd)/sxhkd" $XDG_CONFIG_HOME
ln -s "$(pwd)/bspwm" $XDG_CONFIG_HOME


