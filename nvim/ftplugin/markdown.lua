local o = vim.o
local g = vim.g
local api = vim.api
local cmd = vim.cmd

-- SETTINGS
g.autocompile = 1
o.spell = true
o.tw = 80

-- AUTOCOMMANDS
local augroup = api.nvim_create_augroup("markdown_autocommands", {})

-- autocompile when file changes
api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = {"*"},
	callback = function()
		if(g.autocompile == 1)then
			cmd("silent !pandoc " .. vim.fn.expand('%:p') .. " -o " .. vim.fn.expand('%:r') .. ".pdf &")
		end
	end})
