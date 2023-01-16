
function! CompileMarkdown()
	silent execute "!pandoc % -o %.pdf"
endfunction

augroup markdown_autocommands
	autocmd!

	" compile to pdf when written
	autocmd BufWritePost * call CompileMarkdown()
augroup end

set tw=80 colorcolumn=80
set spell
