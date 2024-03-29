#!/bin/bash
XDG_CONFIG_HOME=~/.config
SCRIPTPATH=$(dirname $(realpath $0))
TIMEZONE="Europe/Berlin"

PACKAGES_MANAGER="npm snapd"
PACKAGES_UTIL="pulseaudio-utils util-linux-user light trash-cli texlive xrandr xbindkeys xvkbd xdotool xclip "
PACKAGES_CLI="zsh neovim"
PACKAGES_DE="bspwm sxhkd dunst polybar rofi sxiv thunderbird"
PACKAGES_GUI="alacritty zathura zathura-zsh-completion zathura-pdf-mupdf feh sxiv  thunderbird"
PACKAGES="$PACKAGES_UTIL $PACKAGES_GUI $PACKAGES_DE $PACKAGES_CLI $PACKAGES_MANAGER"

PACKAGES_PIP="pywal"



# install common packages
echo INSTALLING COMMON PACKAGES

echo "enable:	RPMfusion"
sudo dnf -yq install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "set:		pipewire -> pulseaudio (bluetooth issues)"
sudo dnf -y -q swap --allowerasing pipewire-pulseaudio pulseaudio

echo -e "install:	$PACKAGES"
sudo dnf -y -q install $PACKAGES
sudo dnf -y -q upgrade 

echo -e "install: $PACKAGES_PIP"

echo -e "install: zathura pywal"
mkdir git
cd git
git clone https://github.com/matthewlscarlson/zathura-pywal
cd zathura-pywal 
sudo make install
cd ..

echo -e "install: i3lock color"
git clone https://github.com/Raymo111/i3lock-color
cd i3lock-color
sudo dnf install -y autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel
./install-i3lock-color.sh
cd




# default configurations
echo 
echo DEFAULT CONFIGURATIONS
echo "set:		shell = zsh"
chsh -s /bin/zsh $USER &>/dev/null

echo "set:		timezone = $TIMEZONE"
timedatectl set-ntp 1
timedatectl set-timezone "$TIMEZONE"

echo "disable:	gnome shell"
sudo systemctl disable gdm.service

echo "disable:	pcspkr"
sudo grep -q "blacklist pcspkr" /etc/modprobe.d/blacklist || \
	sudo bash -c "echo blacklist pcspkr >> /etc/modprobe.d/blacklist"

echo "install:	symbol font"
mkdir ~/.local/share/fonts 2>/dev/null
cp "$SCRIPTPATH/polybar/icomoon-feather.ttf"		~/.local/share/fonts/icomoon-feather.ttf

read -p "create hotspot (y/n)? " answer
case ${answer:0:1} in 
	y|Y )
		read -p "name: " name
		read -p "password: " password
		nmcli dev wifi hotspot con-name "$name" ssid "$name" password "$password"
		;;
esac




# set symbolic links
echo
echo SYMLINK CONFIG FILES
XDG_CONFIG_FILES="sxhkd bspwm dunst polybar picom rofi zsh nvim zathura alacritty"
HOME_FILES=".xbindkeys .xinitrc .zshenv .inputrc scripts"
ERROR_FILES=""

echo "set:		$SCRIPTPATH/{$XDG_CONFIG_FILES} -> $XDG_CONFIG_HOME"
for file in $XDG_CONFIG_FILES
do 
	ln -s "$SCRIPTPATH/$file" $XDG_CONFIG_HOME &>/dev/null || ERROR_FILES="$ERROR_FILES $file"
done 
[ -n "$ERROR_FILES" ] && echo "WARNING: failed for $ERROR_FILES"
ERROR_FILES=""

echo "set:		$SCRIPTPATH/{$HOME_FILES} -> ~"
for file in $HOME_FILES
do 
	ln -s "$SCRIPTPATH/$file" ~ &>/dev/null || ERROR_FILES="$ERROR_FILES $file"
done 
[ -n "$ERROR_FILES" ] && echo "WARNING: failed for $ERROR_FILES"
ERROR_FILES=""

echo "set:		$SCRIPTPATH/wallpapers -> ~/Pictures/"
ln -s "$SCRIPTPATH/wallpapers" ~/Pictures/ &>/dev/null || ERROR_FILES="$ERROR_FILES $file"
[ -n "$ERROR_FILES" ] && echo "WARNING: failed for $ERROR_FILES"




# install zsh syntax highligithing
echo
echo INSTALLING ZSH SYNTAX HIGHLIGHTING 
git clone "https://github.com/zsh-users/zsh-syntax-highlighting" $SCRIPTPATH/zsh/zsh-syntax-highlighting &>/dev/null || \
	echo "WARNING: failed to clone"




# install vim plugins
echo 
echo INSTALLING VIM PLUGGINS
echo "install:	vimplug"
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "install:	plugins"
nvim -c "PlugInstall | qa "
echo "install:	coc autocomplete"
nvim -c "CocInstall coc-python coc-clangd coc-html coc-texlab coc-sh | qa"




echo 
echo DONE!
read -p "reboot now (y/n)? " answer
case ${answer:0:1} in 
	y|Y )
		reboot
		;;
	*)
		exit
		;;
esac
