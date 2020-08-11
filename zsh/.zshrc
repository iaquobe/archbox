# Created by newuser for 5.8
# prompt
PS1='%B[%F{red}%n%f%F{yellow}@%f%F{green}%m%f%F{blue} %~%f]%# %b'

#syntax highlighting plugin
# source "/home/iaquobe/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# ZSH_HIGHLIGHT_STYLES[path]=none


#vim bindings with normal backspace behaviour
bindkey -v '^?' backward-delete-char


# remove + and - bindings
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\x2d"

# loading functions 
autoload -Uz compinit
compinit

# aliases

alias muted='muted() { $@ &>/dev/null &; disown }; muted'

alias ls='ls --color=auto'
alias lsl='ls -lh --color=auto'

alias vim=nvim
alias v=nvim
alias tv='muted st nvim'

alias vps='ssh iaquobe@5.189.146.192'

alias git='git --no-pager'
alias gl='git log --all --graph --decorate'

#programs that should not block the terminal
alias zathura='muted zathura'
alias firefox='muted firefox'
alias vimb='muted vimb'

alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
alias suspend='systemctl suspend'

compdef _precommand muted


setopt autocd
