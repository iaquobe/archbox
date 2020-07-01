# Created by newuser for 5.8

# prompt
PS1='%B[%F{red}%n%f%F{yellow}@%f%F{green}%m%f%F{blue} %~%f]%# %b'

bindkey -v

# remove + and - bindings
bindkey -M vicmd -r "+"
bindkey -M vicmd -r "\x2d"

# loading functions 
autoload -Uz compinit

compinit

# aliases

alias muted='muted() { $@ &>/dev/null &; disown &>/dev/null }; muted'

alias vim=nvim
alias zathura='muted zathura'
alias ..='cd ..'
alias suspend='systemctl suspend'

compdef _precommand muted


setopt autocd
