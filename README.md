# Visual Programs

## bspwm
launches: 
1. `dunst`: notification deamon
2. `sxhkd`: keyboard shortcut deamon
3. `polybar`: top bar
4. `feh`: background setter

sets:
1. `xkeyboardmap` to german and swaps `escape` and `caps lock`
2. `EDITOR` to `nvim`

## sxhkd
- `super + u`: frefox
- `alt + @space`: scratchpad
- `super + shift + q`: suspend
- `super + n`: sites
- `super + @space`: dmenu run
- `alt + {Down, Up}`: volume control
- `alt + {Left, Right}`: backlight control

## Compton
- excludes fade from scratchpad
- no shadows for dmenu



# Terminal behaviour

## zsh 
### aliases
1. `calendar` opens `calendar.vim`
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

## vim
### Plugins
- `nerdtree`: file explorer
- `calendar` 
- `smooth-scroll`
- `coc`: completion system (`python`,`css`,`html`,`json`,`c`)
- `gruvbox`: theme
- `devicons`

### Settings
- dont continue comments
- `ctrl + [mov key]`: move window
- some mathematical digraphs
- `<leader>c`: autocorrect


## alacritty
- `ctrl + esc`: enter vim mode
- `ctrl + u/d`: scroll


