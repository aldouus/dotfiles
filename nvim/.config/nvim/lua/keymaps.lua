vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("t", "<c-k>", "<C-\\><C-n>:wincmd k<CR>", { silent = true })
vim.keymap.set("t", "<c-j>", "<C-\\><C-n>:wincmd j<CR>", { silent = true })
vim.keymap.set("t", "<c-h>", "<C-\\><C-n>:wincmd h<CR>", { silent = true })
vim.keymap.set("t", "<c-l>", "<C-\\><C-n>:wincmd l<CR>", { silent = true })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-]>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-[>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-t>", "<C-T>", { noremap = true, silent = true })

for i = 1, 9 do
	vim.api.nvim_set_keymap("n", "<C-" .. tostring(i) .. ">", tostring(i) .. "gt", { noremap = true, silent = true })
end

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

vim.api.nvim_set_keymap("n", "<leader>t", ":vsplit | terminal | windcmd R<CR>", { noremap = true, silent = true })
