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

vim.o.exrc = true

require("vim-options")
require("lazy").setup("plugins")

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "■",
	},
	underline = true,
	signs = true,
})

vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_set_keymap("n", "<C-w>", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-t>", "<C-T>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>b", ":!./build.sh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>z",
	"<cmd>lua require('zen-mode').toggle()<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<M-j>", ":m+1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":m-2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.opt.fillchars:append({ diff = "╱" })

vim.cmd.colorscheme("tokyonight-night")
