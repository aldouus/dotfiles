return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 1,
				width = 120,
			},
		})
		vim.api.nvim_set_hl(0, "ZenBg", { bg = "NONE" })
	end,
}
