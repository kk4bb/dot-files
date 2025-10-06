-- TODO: see :h options

local options = {
	mouse = 'a',
	number = true,
	relativenumber = true,

	-- this enables wrapped lines to still be indented after going to the next line
	breakindent = true,
	undofile = true,

	-- search options,
	ignorecase = true,
	smartcase = true,

	splitright = true,
	splitbelow = true,
	confirm = true,

	-- the border around the help text beneath functions and such
	winborder = "rounded",

	-- tabstop = 8,
	-- softtabstop = 0,
	-- shiftwidth = 8,
	expandtab = false,
	autoindent = true,
	linebreak = true,
	breakindent = true,


}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
	signs = false,
})

-- TODO: read the statusline help section to decide if you need a plugin for it or no
-- vim.cmd(":hi statusline guibg=NONE")

