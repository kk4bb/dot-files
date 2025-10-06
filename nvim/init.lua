-- general options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- saves the default data path in the variable
local data_dir = vim.fn.stdpath('data')

local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not (vim.uv or vim.loop).fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			"--filter=blob:none",
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
	{ "neovim/nvim-lspconfig" },
	{ "lervag/vimtex",                   opt = true }, -- LaTeX support
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'windwp/nvim-autopairs' },
	{ 'numToStr/Comment.nvim', config = function()
		require('Comment').setup()
	end },
	{ 'kylechui/nvim-surround', config = function()
		require('nvim-surround').setup()
	end },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'MeanderingProgrammer/render-markdown.nvim' },
	{ 'williamboman/mason.nvim',                  config = function() require('mason').setup() end },
	{ 'williamboman/mason-lspconfig.nvim' },
}
-- TODO: configure the defualt statusline or use a custom one
-- TODO: use a finder of some sort ("ibhagwan/fzf-lua" ?)
-- TODO: add mappings for render-markdown

require("config.mappings")
require("config.options")
require("config.functions")
require("config.autocmds")

local plugin_path = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.globpath(plugin_path, "*.lua", false, true)) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	require("plugins." .. name)
end

-- to sync the os clipboard with nvim clipboard
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)
