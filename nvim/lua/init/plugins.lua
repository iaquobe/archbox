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
	use 'L3MON4D3/LuaSnip'

	use 'nvim-lualine/lualine.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/playground'

	use 'ggandor/leap.nvim'

	use 'anufrievroman/vim-tex-kawaii'
	use 'dylanaraps/wal.vim'
  	use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
end)

require('init.plugins-config')
