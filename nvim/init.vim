



" PLUGINS

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-webdevicons'
Plug 'itchyny/calendar.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-vdebug/vdebug'
" Plug 'xavierd/clang_complete'
call plug#end()




" VISUAL

colorscheme gruvbox
syntax on
set number relativenumber cursorline nowrap nohlsearch showmode ignorecase
set list listchars=tab:>-
set shiftwidth=3 tabstop=3
let g:tex_flavor = 'latex'
set encoding=UTF-8 spelllang=en_us,de_de
set foldmethod=indent foldnestmax=1 foldcolumn=1 foldlevel=99
set clipboard=unnamedplus
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 12
set updatetime=400
let g:limelight_conceal_ctermfg = 'gray'
let g:goyo_linenr = 'relativenumber'
let g:goyo_height="90%"
let g:goyo_width=90
let g:gutentags_cache_dir='~/.local/share/gutentags'

let mapleader=" "




" AUTOCMDS
function! s:goyo_enter()
	set relativenumber number
	set scrolloff=999
	Limelight
endfunction

function! s:goyo_leave()
	set scrolloff=0
	Limelight!
endfunction

" Reload config on write
augroup autocommands
	autocmd!
	autocmd BufWritePost init.vim source $MYVIMRC
	autocmd! User GoyoLeave Limelight!
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup end

" stop auto continue comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"coc autocomplete
inoremap <silent><expr> <c-space> coc#refresh()




" MAPPINGS

" navigate windows with ctrl + mov
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
" auto correct with leader + c
map <Leader>c mm0]s1z=`m
" set ticks around word with leader + `
map <Leader>` i`<ESC>ea`<ESC>
" delete last typed word with ctrl + u
inoremap <C-u> <C-w>

function! InsertLines(direction)
	if a:direction == 1
		execute "normal ". v:count1. "o" 
		execute "normal ". v:count1. "k" 
	elseif a:direction == -1
		execute "normal ". v:count1. "O" 
		execute "normal j" 
	endif
endfunction
nmap <leader>j :<c-u>call InsertLines(1)<ESC>
nmap <leader>k :<c-u>call InsertLines(-1)<ESC>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

nmap <leader>y :Goyo<CR>




" DIGRAPHS

dig ZZ 8484		"ℤ
dig NN 8469		"ℕ
dig RR 8477		"ℝ
dig !( 8713		"∉
dig !C 8836		"⊄
dig && 8743		"∧
dig \|\| 8744	"∨
dig as 8336		"ₐ
dig es 8337		"ₑ
dig os 8338		"ₒ
dig xs 8339		"ₓ
dig hs 8341		"ₕ
dig ks 8342		"ₖ
dig ls 8343		"ₗ
dig ms 8344		"ₘ
dig ns 8345		"ₙ
dig ps 8346		"ₚ
dig ss 8347		"ₛ
dig ts 8348		"ₜ
dig pi 960		"π

