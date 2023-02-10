--AUTOCMDS
--[[
local autocommands = api.nvim_create_augroup("autocommands", {clear = true})

api.nvim_create_autocmd('User GoyoEnter', {
	group = autocommands, 
	callback = function()
		
}]]

vim.cmd([[
function! s:goyo_enter()
	set relativenumber number
	set scrolloff=999
	hi Normal ctermbg=none
	Limelight
endfunction

function! s:goyo_leave()
	set scrolloff=0
	hi Normal ctermbg=none
	Limelight!
endfunction

augroup autocommands
	autocmd!
	"reload config on write
	autocmd BufWritePost init.vim source $MYVIMRC

	"limelight for goyo
	autocmd! User GoyoLeave Limelight!
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()

	"stop auto continue comment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	"terminal without line numbers and enter insert
	autocmd TermOpen * setlocal nonumber norelativenumber
	autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
augroup end]])
