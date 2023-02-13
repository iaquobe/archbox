local cmd = vim.cmd

local highlight = function()
	cmd('highlight Normal ctermbg=none')
	cmd('highlight Folded ctermbg=none')
	cmd('highlight clear CursorLine')
	cmd('highlight CursorLine cterm=underline')
	cmd('highlight VertSplit ctermbg=none')
	cmd('highlight TabLineFill cterm=none')
	cmd('highlight TabLine cterm=none')
end

return { highlight = highlight }
