
" FUNCTIONS
function! CompileLatex()
	silent execute "!(make; make clean) &>compile.log &"
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
augroup end





" OPTIONS
setlocal spell

" MAPPINGS
noremap <Leader>b :call BeginEnv()<ESC>
