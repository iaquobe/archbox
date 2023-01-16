



" PLUGINS

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/calendar.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'wesQ3/vim-windowswap'
call plug#end()




" VISUAL

colorscheme gruvbox
syntax on
set number relativenumber cursorline nowrap nohlsearch showmode ignorecase
set list listchars=tab:>-
set shiftwidth=3 tabstop=3
set encoding=UTF-8 spelllang=en_us,de_de
set foldmethod=indent foldnestmax=1 foldcolumn=1 foldlevel=99
set clipboard=unnamedplus
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 12
set updatetime=400
set mouse=
highlight Normal ctermbg=none


let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''

let g:tex_flavor = 'latex'
let g:tex_flavor = 'latex'
let g:tex_flavor = 'latex'
let g:limelight_conceal_ctermfg = 'gray'
let g:goyo_linenr = 'relativenumber'
let g:goyo_height="90%"
let g:goyo_width=90
let g:gutentags_cache_dir='~/.local/share/gutentags'
let mapleader=" "


" COMMANDS

command! X wa|qa


" AUTOCMDS
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
	" reload config on write
	autocmd BufWritePost init.vim source $MYVIMRC

	" limelight for goyo
	autocmd! User GoyoLeave Limelight!
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()

	" stop auto continue comment
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	" terminal without line numbers and enter insert
	autocmd TermOpen * setlocal nonumber norelativenumber
	autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
augroup end





" MAPPINGS

"coc autocomplete 
inoremap <silent><expr> <c-space> coc#refresh()

" exit term mode
tnoremap <C-o> <C-\><C-N>

" navigation 
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
vnoremap <leader>m mm:s/\%V.*\%V./$&$<CR>`m

" auto correct with leader + c
map <Leader>c mm0]s1z=`m

" delete last typed word with ctrl + u
inoremap <C-u> <C-w>

" add lines with [number]<space>+<j/k>
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

" smooth scroll plugin
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" goyo open
nmap <leader>y :Goyo<CR>

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
