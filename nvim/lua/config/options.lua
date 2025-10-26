-- dependencies/packages
require("config.lazy")
require("config.keymaps")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- general config
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- column on left of line numbers for signs

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false -- highlighting
vim.opt.termguicolors = true

vim.opt.expandtab = true

vim.wo.linebreak = true
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.inccomand = "split"

vim.o.winborder = "rounded"

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.foldcolumn = "auto:9"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep:,foldclose:"
vim.o.statuscolumn =
	'%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : "   ") : "  " }%*'

vim.cmd.colorscheme("catppuccin-mocha")
