
" plugin manager
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-vdebug/vdebug'
Plug 'xavierd/clang_complete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-webdevicons'



call plug#end()

" look
colorscheme gruvbox
syntax on
set relativenumber
set noshowmode
set encoding=UTF-8
set nowrap
set number
set cursorline
set shiftwidth=3
set tabstop=3
set clipboard=unnamed 
set updatetime=300
set list
set listchars=tab:>-
set spell
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 12

let mapleader=" "

" function
" autocmd VimEnter * NERDTree
autocmd BufWritePost init.vim source $MYVIMRC
autocmd BufWritePost *.md silent !md2pdf %

" dont automatically continue comment in new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" python autocomplete
" dont show completion menu automatically when typing .
" let g:jedi#popup_on_dot = 0
" dont show function signature popup
" let g:jedi#show_call_signatures=0

"coc autocomplete
inoremap <silent><expr> <C-Space> coc#refresh()

" keyboard mapping
map <C-BS> bcw 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
map <Leader>c mm1z=`m


