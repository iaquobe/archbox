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
	"jdtls",
	"vtsls",
	"marksman"},
	automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
 end

require('lspconfig').clangd.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').cmake.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').pyright.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').lua_ls.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').bashls.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').vtsls.setup {capabilities = capabilities, on_attach = on_attach}
require('lspconfig').rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"rustup", "run", "stable", "rust-analyzer",
	}
}

require('lspconfig').texlab.setup {capabilities = capabilities ,settings = { textlab = {build = { args = {"-pdf", "-interaction=nonstopmode"}}}}}
require('lspconfig').dartls.setup {}
require('lspconfig').r_language_server.setup {}
require('lspconfig').jdtls.setup {}
