# Dropdown terminal: scratchpad

## dependecies

Du brauchst das `alacritty` terminal. geht bestimmt auch mit `urxvt` aber ich weiß nicht wie.

## installation

#### toggle script

Der script toggled visibility vom terminal und macht ne neue instanz auf falls du die letzte geschlossen hast.  
Die location ist eigentlich egal, solang du es von sxhkd richtig aufrufst.

> ~/scripts/scratch:  
>
>		#!/usr/bin/bash
>
>		id="$(xdotool search --class scratchpad)" 
>		[ -z "$id" ] && xtoolwait alacritty --class scratchpad,scratchpad 
>
>		id="$(xdotool search --class scratchpad)" 
>		bspc node "$id" -m focused 
>		bspc node "$id" --flag hidden -f

#### wm rules

Damit das terminal an der richtigen stelle ist brauchst du das in deiner bspwm config

> ~/.config/bspwm/bspwmrc:  
>
>		bspc rule -a scratchpad sticky=on hidden=on state=floating follow=on rectangle=1000x150+310+5 border=off monitor=focused

#### keyboard shortcuts

Als letztes brauchst du noch nen shortcut für sxhkd bei mir sieht das so aus:

> ~/.config/sxhkd/sxhkdrc  
>
>		alt + @space
>			~/scripts/scratch
