local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({zindex = 2}),
		documentation = cmp.config.window.bordered({zindex = 1}),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},{
		{ name = 'buffer' },
	})
})

vim.keymap.set("n","<C-p>",vim.diagnostic.goto_prev,{silent = true})
vim.keymap.set("n","<C-n>",vim.diagnostic.goto_next,{silent = true})
