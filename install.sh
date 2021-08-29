#!/bin/bash
XDG_CONFIG_HOME=~/.config
SCRIPTPATH=$(dirname $(realpath $0))
PACKAGES="util-linux-user alacritty zsh bspwm sxhkd dunst polybar rofi feh neovim xrandr texlive npm sxiv xrandr xbindkeys xvkbd light xdotool"
TIMEZONE="Europe/Berlin"




# install common packages
echo INSTALLING COMMON PACKAGES
echo installing packages: $PACKAGES
sudo dnf upgrade 
sudo dnf install $PACKAGES




# default configurations
echo DEFAULT CONFIGURATIONS
echo change to zsh 
chsh -s /bin/zsh $USER

echo set timezone to $TIMEZONE
timedatectl set-ntp 1
timedatectl set-timezone "$TIMEZONE"

echo disable gnome shell
sudo systemctl disable gdm.service

echo "changing back to pulseaudio (because of bluetooth issues)"
sudo dnf swap --allowerasing pipewire-pulseaudio pulseaudio
sudo dnf install pulseaudio-utils 

echo disabling beeping module
echo blacklist pcspkr >> /etc/modprobe.d/blacklist

echo INSTALLING SYMBOL FONT
mkdir ~/.local/share/fonts
echo "$SCRIPTPATH/polybar/icomoon-feather.ttf ->	~/.local/share/fonts/icomoon-feather.ttf"
cp "$SCRIPTPATH/polybar/icomoon-feather.ttf"		~/.local/share/fonts/icomoon-feather.ttf




# set symbolic links
echo SETTING SYMBOLIC LINKS

echo "$SCRIPTPATH/sxhkd ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/sxhkd"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/bspwm ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/bspwm"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/dunst ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/dunst"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/polybar ->	$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/polybar"	$XDG_CONFIG_HOME

echo "$SCRIPTPATH/rofi ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/rofi"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/zsh ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/zsh/"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/nvim ->		$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/nvim"		$XDG_CONFIG_HOME

echo "$SCRIPTPATH/zathura ->	$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/zathura"	$XDG_CONFIG_HOME

echo "$SCRIPTPATH/alacritty ->$XDG_CONFIG_HOME"
ln -s "$SCRIPTPATH/alacritty"	$XDG_CONFIG_HOME

echo "$SCRIPTPATH/.xbindkeysrc ->	~"
ln -s "$SCRIPTPATH/.xbindkeysrc"	~

echo "$SCRIPTPATH/.xinitrc ->	~"
ln -s "$SCRIPTPATH/.xinitrc"		~

echo "$SCRIPTPATH/.zshenv ->	~"
ln -s "$SCRIPTPATH/.zshenv"		~

echo "$SCRIPTPATH/.inputrc ->	~"
ln -s "$SCRIPTPATH/.inputrc"		~

echo "$SCRIPTPATH/scripts ->	~"
ln -s "$SCRIPTPATH/scripts"		~

echo "$SCRIPTPATH/wallpapers ->	~/Pictures/"
ln -s "$SCRIPTPATH/wallpapers"	~/Pictures/




# install zsh syntax highligithing
echo INSTALLING ZSH SYNTAX HIGHLIGHTING 
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" $SCRIPTPATH/zsh/zsh-syntax-highlighting




# install von plugins
echo INSTALLING VIM PLUGGINS
echo installing vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo installing plugins
nvim -c "PlugInstall | qa "
echo installing coc autocompletion
nvim -c "CocInstall coc-python coc-clangd coc-html coc-texlab coc-sh | qa"




echo DONE!
read -p "do you want to reboot (y/n)?" answer
case ${answer:0:1} in 
	y|Y )
		reboot
		;;
	*)
		exit
		;;
esac
