
" FUNCTIONS
function! OpenDefinition()
	redir => output 
	silent normal [D
	redir END

	let file = split(output, "\n")[0]
	let linenr = split(split(output, "\n")[1])[1]

	exe "split " . fnameescape(file)
	exe "normal " . linenr . "Gzz"

endfunction


" MAPPINGS
noremap <leader>d :call OpenDefinition()


setlocal foldmethod=syntax
normal zM 
