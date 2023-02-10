local opt_local = vim.opt_local
local keymap = vim.keymap
local ui = vim.ui
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

-- FUNCTION
cmd([[
function! EnvList(ArgLead, CmdLine, CursorPos)
	let list = [
				\"align*",
				\"align",
				\"itemize",
				\"enumerate",
				\"equation",
				\"description",
				\]
	let completion = filter(list, 'v:val =~ "^' . a:ArgLead . '"')
	echo completion
	return completion
endfunction
]])

-- AUTOCOMMANDS
local augroup = api.nvim_create_augroup("latex_autocommands", {})

-- autocompile when file changes
api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = {"*"},
	command = "silent execute '!(latexmk -bibtex -pdf -interaction=nonstopmode; latexmk -c) &>compile.log &'"
	})


-- OPTIONS
opt_local.spell = true
opt_local.colorcolumn = "80"

-- KEYMAP
-- begin environment with <leader>b
keymap.set('n', '<leader>b', function()
	ui.input({ prompt = "begin: ", completion = "customlist,EnvList"},
	function(input)
		if(input ~= nil) then
			local linenr = fn.line(".")
			api.nvim_buf_set_lines(0, linenr, linenr, true, {"\\begin{" .. input .. "}", "\\end{" .. input .. "}" })
			cmd("normal j=j")
		end
	end)
end)

cmd("normal zM")
