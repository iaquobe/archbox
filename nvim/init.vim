
" plugin manager
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-vdebug/vdebug'
Plug 'xavierd/clang_complete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-webdevicons'
Plug 'itchyny/calendar.vim'
Plug 'terryma/vim-smooth-scroll'


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
set showmode
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

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>




dig ZZ 8484
dig NN 8469
dig RR 8477

dig !( 8713
dig !C 8836
dig && 8743
dig \|\| 8744

dig as 8336
dig es 8337
dig os 8338
dig xs 8339
dig hs 8341
dig ks 8342
dig ls 8343
dig ms 8344
dig ns 8345
dig ps 8346
dig ss 8347
dig ts 8348

nmap <leader>k O<ESC>j
