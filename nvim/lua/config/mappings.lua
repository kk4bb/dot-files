local mappings = {
	{ { 'n', 'v' }, 'j',          'gj' },
	{ { 'n', 'v' }, 'k',          'gk' },
	{ { 'n', 'v' }, '<down>',     'gj' },
	{ { 'n', 'v' }, '<up>',       'gk' },

	{ 'n',          '<Esc>',      '<cmd>nohlsearch<CR>' },
	{ 't',          '<Esc><Esc>', '<C-\\><C-n>',           { desc = 'Exit terminal mode' } },

	{ { 'n', 'v' }, 'x',          '"_x',                   { noremap = true, silent = true } },
	{ { 'n', 'v' }, 'X',          'V"_x',                  { noremap = true, silent = true } },

	{ 'n',          '<leader>w',  ':update<CR>' },
	{ 'n',          '<leader>W',  ':update<CR>:source<CR>' },

	{ 'n',          '<C-h>',      '<C-w><C-h>',            { desc = 'Move focus to the left window' } },
	{ 'n',          '<C-l>',      '<C-w><C-l>',            { desc = 'Move focus to the right window' } },
	{ 'n',          '<C-j>',      '<C-w><C-j>',            { desc = 'Move focus to the lower window' } },
	{ 'n',          '<C-k>',      '<C-w><C-k>',            { desc = 'Move focus to the upper window' } },
}

-- Keymaps for LSP actions (only active when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format Buffer'})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})


for _, map in ipairs(mappings) do
	local mode, lhs, rhs, opts = unpack(map)
	vim.keymap.set(mode, lhs, rhs, opts or {})
end
