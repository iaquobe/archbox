
function! CompileLatex()
	let pdflatex="pdflatex ". expand('%'). "; "
	let bibtex="bibtex ". expand('%:r'). "; "
	silent execute "!(". pdflatex. bibtex. pdflatex. pdflatex. ") &>compile.log &"
endfunction

augroup latex_autocommands
	autocmd!


	" compile latex file when chaged
	autocmd BufWritePost *.tex call CompileLatex()
augroup end
