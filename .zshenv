
export ZDOTDIR=~/.config/zsh
export LESSHISTFILE=~/.config/less
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

PATH=$PATH":$HOME/bin"
PATH=$PATH":$HOME/.local/bin"
PATH=$PATH":$HOME/scripts"
PATH=$PATH":."
PATH=$PATH":$HOME/.cargo/bin/"


if [ -e /home/iaquobe/.nix-profile/etc/profile.d/nix.sh ]; then . /home/iaquobe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
