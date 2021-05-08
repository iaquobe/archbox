
" FUNCTIONS
function! CompileLatex()
	let pdflatex="pdflatex ". expand('%'). "; "
	let bibtex="bibtex ". expand('%:r'). "; "
	silent execute "!(". pdflatex. bibtex. pdflatex. pdflatex. ") &>compile.log &"
endfunction


function! EnvList(ArgLead, CmdLine, CursorPos)
	let list = [
				\"align*",
				\"align",
				\"itemize",
				\"enumerate",
				\"description",
				\]
	let completion = filter(list, 'v:val =~ "^' . a:ArgLead . '"')
	echo completion
	return completion
endfunction


function! BeginEnv()
	try
		let choiche = input("begin: ", "", "customlist,EnvList")

		let begin="\\begin{" . choiche . "}\n" 
		let end="\\end{" . choiche . "}"
		execute "normal o" . begin . end 
	endtry
endfunction



" AUTOCOMMANDS
augroup latex_autocommands
	autocmd!

	" compile latex file when chaged
	autocmd BufWritePost * call CompileLatex()
	autocmd VimLeave * !make clean
augroup end


" OPTIONS
setlocal spell

" MAPPINGS
noremap <Leader>b :call BeginEnv()<ESC>
