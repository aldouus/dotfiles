return {
	"folke/tokyonight.nvim",
	lazy = false,
	name = "tokyonight",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			on_colors = function(colors)
				colors.red = colors.blue2
				colors.green1 = colors.fg
				colors.blue5 = colors.fg_dark
			end,
			transparent = true,
			on_highlights = function(hl)
				hl.DiffDelete = { fg = "#292e42" }
				hl.SnacksPickerPrompt = { fg = "#cccccc", bg = "NONE" }
				hl.SnacksPickerSelection = { fg = "#ffffff", bg = "#000000", bold = true }
				hl.SnacksPickerResults = { fg = "#bbbbbb", bg = "NONE" }
				hl.SnacksPickerBackground = { bg = "#000000" }
				hl.SnacksPickerBar = { fg = "#cccccc", bg = "#000000" }
				hl.SnacksPickerBorder = { fg = "#444444", bg = "NONE" }
				hl.SnacksPickerTitle = { fg = "#bbbbbb", bg = "NONE" }
			end,
		})
	end,
}
