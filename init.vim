
" plugin manager
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'vim-vdebug/vdebug'
Plug 'xavierd/clang_complete'
" Plug 'ryanoasis/vim-devicons'

call plug#end()


" look
set noshowmode
set encoding=UTF-8
colorscheme gruvbox
syntax on
set nowrap
set number
set cursorline
set shiftwidth=3
set tabstop=3
set clipboard=unnamed 


" function
" autocmd VimEnter * NERDTree
autocmd BufWritePost init.vim source $MYVIMRC


" python autocomplete
" dont show completion menu automatically when typing .
let g:jedi#popup_on_dot = 0
" dont show function signature popup
let g:jedi#show_call_signatures=0

" keyboard mapping
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h


