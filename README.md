# Visual Programs

# Terminal behavior

## zsh 
### aliases
1. `calendar` opens `calcurse`
2. `vps` shortcut to `ssh` into my vps (don't worry, it's saved)
3. `pdb` python debugger
4. `git` defaults to `--no-pager`
5. `muted` runs program `disown`ed and disconnected from `I/O`
	- defaulted by `zathura`, `firefox`, `spotify`, `alacritty`, `vimiv`
6. `webcam` opens `mpv` with webcam open

### other
- autocd
- syntax highlitghting
- detects `ssh` in prompt
- sets `EDITOR` variables
- `less` colors for man pages
- `cd` also runs `ls`

## vim
### Plugins
- `nerdtree`         : file explorer
- `calendar` 
- `smooth-scroll`
- `coc`              : completion system (`python`,`css`,`html`,`json`,`c`)
- `gruvbox`          : theme
- `devicons`

### Settings
- dont continue comments
- `ctrl + [mov key]`      : move window
- some mathematical digraphs
- `<leader>c`             : autocorrect
- `<leader><backtick>`    : backticks word
- `<leader>j/k`           : insterts line bellow/above, command is countable


## alacritty
- `ctrl + esc`: enter vim mode



# Scripts

## vfind
search file content and open them in `vim`
- `greps` case insensitive and pipes to `fzf` to select file
- `fzf` previews found patterns
- `vim` opens searching the pattern and with highlitghting

##### Usage
	vfind PATTERN FILES...

## zfind
search file content and open them in `zathura`
- `greps` case insensitive and pipes to `fzf` to select file
- `fzf` previews found patterns (uses `pdftotext`)
- `zathura` opens searching the pattern 
- does not swallow window, but I'm planing to implement it

##### Usage
	zfind PATTERN FILES...

## scratchpad
Toggles visibility of terminal floating atop

