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

cmd([[
function! SectionList(ArgLead, CmdLine, CursorPos)
	let list = [
				\"section",
				\"subsection",
				\"subsubsection",
				\]
	let completion = filter(list, 'v:val =~ "^' . a:ArgLead . '"')
	echo completion
	return completion
endfunction
]])

-- AUTOCOMMANDS
local augroup = api.nvim_create_augroup("ftp_latex_autocommands", {})

-- autocompile when file changes
api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = {"*"},
	command = "TexlabBuild"
})


-- OPTIONS
-- opt_local.spell = true

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

keymap.set('n', '<leader>s', function()
	ui.input({ prompt = "section type: ", completion = "customlist,SectionList"},
	function(input)
		if(input == nil) then
			input = "section"
		end
		ui.input({ prompt = "title: " }, function(title)
			if(title ~= nil) then
				local linenr = fn.line(".")
				api.nvim_buf_set_lines(0, linenr, linenr, true, {"\\" .. input .. "{" .. title .. "}"})
				cmd("normal j")
			end
		end)
	end)
end)


--cmd("normal zM")
