local o = vim.o
local g = vim.g
local api = vim.api
local cmd = vim.cmd

-- SETTINGS
g.autocompile = 1
o.spell = true
o.tw = 80

function Compile ()
	cmd('!$(Rscript -e \'rmarkdown::render("' .. vim.fn.expand('%:p') .. '")\' &> compile.log) &')
end


-- AUTOCOMMANDS
local augroup = api.nvim_create_augroup("rmarkdown_autocommands", {})

-- autocompile when file changes
api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = {"*"},
	callback = function()
		if(g.autocompile == 1) then
			cmd('silent lua Compile()')
		end
	end})
