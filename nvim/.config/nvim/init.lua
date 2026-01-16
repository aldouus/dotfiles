local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.mouse = ""
vim.opt.mousemodel = "extend"

vim.o.exrc = true

require("vim-options")
require("keymaps")
require("lazy").setup("plugins")

vim.cmd.colorscheme("tokyonight-night")

local groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"TermNormal",
	"SignColumn",
	"EndOfBuffer",
	"MsgArea",
	"VertSplit",
	"StatusLine",
}

for _, grp in ipairs(groups) do
	vim.api.nvim_set_hl(0, grp, { bg = "none" })
end
