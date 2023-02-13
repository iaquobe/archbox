local highlight = require("init.highlight")

local g = vim.g
local o = vim.o
local cmd = vim.cmd

--VISUAL
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = false
o.hlsearch = false

o.showmode = true
o.ignorecase = true

-- o.list = true
-- o.listchars = "tab:>-"
o.fillchars= "foldopen:┬,foldclose:┴"


o.shiftwidth = 3
o.tabstop = 3
o.encoding = "UTF-8"
o.spelllang = "en_us,de_de"

o.foldmethod = "indent"
o.foldnestmax = 1
o.foldcolumn = '1'
o.foldlevel = 99

o.clipboard = "unnamedplus"
o.guifont = "DejaVuSansMono Nerd Font Mono 12"
o.updatetime = 400
o.mouse = ""

cmd("colorscheme wal")
highlight.highlight()
cmd("syntax on")

g.NERDTreeMapJumpNextSibling = ''
g.NERDTreeMapJumpPrevSibling = ''

g.tex_flavor = 'latex'
g.limelight_conceal_ctermfg = 'gray'
g.goyo_linenr = 'relativenumber'
g.goyo_height = "90%"
g.goyo_width = 90
g.gutentags_cache_dir = '~/.local/share/gutentags'
g.context_enabled = 1
g.context_nvim_no_redraw = 1
g.context_presenter = 'nvim-float'
g.mapleader = " "

