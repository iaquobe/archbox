
" FUNCTIONS
function! CompileLatex()
	"silent execute !(make; make clean) &>compile.log &
	silent execute '!(latexmk -bibtex -pdf -interaction=nonstopmode; latexmk -c) &>compile.log &'
endfunction



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


function! BeginEnv()
	try
		let choiche = input("begin: ", "", "customlist,EnvList")

		let beg="\\begin{" . choiche . "}"
		let end="\\end{" . choiche . "}"
		call append('.', [beg, end])
		normal j=j
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
" setlocal tw=80 
setlocal colorcolumn=80

" MAPPINGS
noremap <Leader>b :call BeginEnv()<ESC>
noremap <Leader>i o\item \textbf{}:<ESC>
noremap <Leader>f a\textbf{

