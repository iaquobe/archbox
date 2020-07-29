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
alias vim=nvim
alias v=nvim
alias tv='muted st nvim'

#programs that should not block the terminal
alias zathura='muted zathura'
alias firefox='muted firefox'
alias vimb='muted vimb'

alias suspend='systemctl suspend'

compdef _precommand muted


setopt autocd
