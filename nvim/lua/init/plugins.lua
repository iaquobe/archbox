require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'preservim/nerdtree'
	use 'junegunn/limelight.vim'
	use 'junegunn/goyo.vim'
	use 'junegunn/fzf.vim'
	use 'ryanoasis/vim-devicons'
	use 'wesQ3/vim-windowswap'
	use 'wellle/context.vim'

	-- completion
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/playground'

	use 'anufrievroman/vim-tex-kawaii'
	use 'dylanaraps/wal.vim'
end)

require('init.plugins-config')
