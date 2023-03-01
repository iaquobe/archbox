require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls",
	"clangd",
	"cmake",
	"dockerls",
	"bashls",
	"pyright",
	"texlab",
	"rust_analyzer",
	"marksman"}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {capabilities = capabilities}
require('lspconfig').cmake.setup {capabilities = capabilities}
require('lspconfig').pyright.setup {capabilities = capabilities}
require('lspconfig').lua_ls.setup {capabilities = capabilities}
require('lspconfig').bashls.setup {capabilities = capabilities}
require('lspconfig').rust_analyzer.setup {
	capabilities = capabilities,
	cmd = {
		"rustup", "run", "stable", "rust-analyzer",
	}
}

require('lspconfig').texlab.setup {capabilities = capabilities ,settings = { textlab = {build = { args = {"-pdf", "-interaction=nonstopmode"}}}}}
