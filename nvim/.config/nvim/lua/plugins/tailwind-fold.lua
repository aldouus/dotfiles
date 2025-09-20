return {
	"razak17/tailwind-fold.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tailwind-fold").setup({
			enabled = false,
			symbol = "→",
			ft = {
				"html",
				"javascript",
				"typescript",
				"typescriptreact",
				"javascriptreact",
				"vue",
				"blade",
				"php",
				"svelte",
				"astro",
			},
		})
	end,
	vim.api.nvim_set_keymap("n", "<leader>tf", ":TailwindFoldToggle<CR>", { noremap = true, silent = true }),
}
