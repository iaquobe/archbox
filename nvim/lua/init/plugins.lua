vim.cmd([[
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
Plug 'wellle/context.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'anufrievroman/vim-tex-kawaii'
call plug#end()
]])
