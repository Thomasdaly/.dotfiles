vim.g.mapleader = " "
vim.g.maplocalleader = "//"

require("vim-options")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = ""
vim.opt.conceallevel = 2
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
vim.cmd("colorscheme tokyonight")
