local highlight = require("init.highlight")

local o = vim.o
local api = vim.api
local cmd = vim.cmd

local augroup = api.nvim_create_augroup("luaautocmd", {clear = true})

-- stop auto continue comment
api.nvim_create_autocmd('FileType', {
	pattern = {"*"},
	group = augroup,
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

--terminal without line numbers and enter insert
api.nvim_create_autocmd('TermOpen', {
	pattern = {"*"},
	group = augroup,
	command = "setlocal nonumber norelativenumber"
})

api.nvim_create_autocmd('User', {
	pattern = {"GoyoEnter"},
	group = augroup,
	nested = true,
	callback = function()
		o.relativenumber = false
		o.number = false
		o.scrolloff = 999
		highlight.highlight()
		cmd("Limelight")
		cmd("ToggleDiagOff")
		require('lualine').hide()
	end
})

api.nvim_create_autocmd('User', {
	pattern = {"GoyoLeave"},
	group = augroup,
	nested = true,
	callback = function()
		o.relativenumber = true
		o.number = true
		o.scrolloff = 0
		highlight.highlight()
		cmd("Limelight!")
		cmd("ToggleDiagOn")
		require('lualine').hide({unhide=true})
	end
})
