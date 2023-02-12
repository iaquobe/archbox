### VISUALS
# prompt
PS1='%B[%F{red}%n%f%F{yellow}@%f%F{green}%m%f%F{blue} %2~%f]%# %b'
[[ -n "$SSH_CLIENT" ]] && PS1="%F{blue}SSH:%f$PS1"

(cat ~/.cache/wal/sequences &)


export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export PAGER="less"
export LS_COLORS='di=94:fi=93:ln=96:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=92:*.rpm=90'



### BINDINGS
# vim bindings with normal backspace behaviour
bindkey -v '^?' backward-delete-char

# remove + and - bindings
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\x2d"

# loading functions and case insensitive
setopt completealiases
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit




### ALIASES
# muted programs are detached from terminal and dont produce output 
alias muted='() { "$@" &>/dev/null &; disown }'
muted_prog=( zathura firefox vimiv spotify alacritty )
for prog in $muted_prog
do
	alias $prog="muted $prog"
done

# colored man page

# short aliases
alias ls='ls --color=auto'
alias cd='() {cd "$@" && ls -A}'
alias cp='() {cp "$@" && ls -A "$(dirname "$(readlink -f "${@[-1]}")")"}'
alias mv='() {mv "$@" && ls -A "$(dirname "$(readlink -f "${@[-1]}")")"}'
alias rm='() {trash "$@" && ls -A "$(dirname "$(readlink -f "${@[-1]}")")"}'
alias vim=nvim
alias v=nvim
alias vi=nvim
alias idv='nvim -S ~/.config/nvim/idv.vim'
alias rss='newsbeuter -u ~/.config/newsbeuter/urls -C ~/.config/newsbeuter/config'
alias vps='ssh iaquobe@5.189.146.192 -p 8361 -o ServerAliveInterval=15'
alias pdb='python -m pdb'
# alias git='git --no-pager'
alias gl='git log --all --graph --decorate'
alias skb='setxkbmap de -option caps:swapescape'
alias uskb='setxkbmap de -option'
alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
alias gitcompush='() {git add .; git commit $@; git push}'

alias v0='() {/opt/cisco/anyconnect/bin/vpn -s connect vpn2.mpdl.mpg.de; ip link show cscotun0;}'
alias v1='echo "password: "; read PASSWD; printf '\''1\nlamberthartmann\n$PASSWD\ny'\'' | /opt/cisco/anyconnect/bin/vpn -s connect vpn2.mpdl.mpg.de; ip link show cscotun0;'
alias vD='/opt/cisco/anyconnect/bin/vpn disconnect; ip link show cscotun0;'




# compiles autocomplete
compdef _precommand muted

# fixes some applications
export _JAVA_AWT_WM_NONREPARENTING=1

# syntax highlighting
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[path]=none
