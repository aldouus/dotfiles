vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

vim.wo.number = true

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "■",
	},
	underline = true,
	signs = true,
})

vim.api.nvim_create_user_command("W", "w", {})

vim.opt.fillchars:append({ diff = "╱" })
