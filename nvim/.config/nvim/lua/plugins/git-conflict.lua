return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		vim.cmd([[
      highlight DiffText guibg=#3c3836 guifg=#ebdbb2
    ]])

		require("git-conflict").setup({
			default_mappings = true,
			default_commands = true,
			disable_diagnostics = false,
			list_opener = "copen",
			highlights = {
				current = "Visual",
			},
		})
	end,
}
