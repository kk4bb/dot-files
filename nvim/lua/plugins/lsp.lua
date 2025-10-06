vim.lsp.enable({'clangd', 'pyright', 'lua_ls', 'ts_ls', 'bashls', 'html'})

vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}

