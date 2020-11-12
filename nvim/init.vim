
" plugin manager
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-vdebug/vdebug'
Plug 'xavierd/clang_complete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-webdevicons'
Plug 'itchyny/calendar.vim'



call plug#end()

" VISUAL
colorscheme gruvbox
syntax on
set relativenumber
set noshowmode
set encoding=UTF-8
set nowrap
set nohlsearch
set nospell
set number
set cursorline
set shiftwidth=3
set tabstop=3
set clipboard=unnamed 
set list
set listchars=tab:>-
set spell
" devicons
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 12

"time for autocomplete to refresh in ms
set updatetime=300

let mapleader=" "



" AUTOCMDS

" source vimconfig when changed
autocmd BufWritePost init.vim source $MYVIMRC

"markdown to pdf when saving markdown file
autocmd BufWritePost *.md silent !md2pdf %

" stop auto continue comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"coc autocomplete
inoremap <silent><expr> <C-Space> coc#refresh()



" MAPPINGS

" navigate windows with ctrl + mov
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" auto correct with leader + c
map <Leader>c mm1z=`m

nmap <leader>j o<ESC>j
nmap <leader>j o<ESC>k




dig ZZ 8484
dig NN 8469
dig RR 8477

dig !( 8713
dig !C 8836
dig && 8743
dig \|\| 8744

dig is 7522
dig rs 7523
dig us 7524
dig vs 7525

dig as 8336
dig es 8337
dig os 8338
dig xs 8339
dig hs 8340
dig ks 8341
dig ls 8342
dig ms 8343
dig ns 8344
dig ps 8345
dig ss 8346
dig ts 8347

nmap <leader>k O<ESC>j
