return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "quarto" },
	opts = {
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
		checkbox = {
			enabled = false,
		},
		render_modes = { "n", "c", "t", "i" },
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)
		vim.keymap.set("n", "<leader>fm", function()
			require("render-markdown").toggle()
		end, { desc = "Toggle Markdown Rendering" })
	end,
}
