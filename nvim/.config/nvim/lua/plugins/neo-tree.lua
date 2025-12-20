local function set_neotree_highlights()
	local dimmed_color = "#a8b1d6"
	local mini_icons_groups = {
		"MiniIconsAzure",
		"MiniIconsBlue",
		"MiniIconsCyan",
		"MiniIconsGreen",
		"MiniIconsGrey",
		"MiniIconsOrange",
		"MiniIconsPurple",
		"MiniIconsRed",
		"MiniIconsYellow",
	}
	for _, group in ipairs(mini_icons_groups) do
		vim.api.nvim_set_hl(0, group, { fg = dimmed_color })
	end
	vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = dimmed_color })
	vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = dimmed_color })
	vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = dimmed_color })
	vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = dimmed_color })
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"echasnovski/mini.icons",
	},
	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "document_symbols" },
			source_selector = {
				winbar = false,
				statusline = false,
			},
			filesystem = {
				window = {
					width = 48,
				},
			},
			document_symbols = {
				follow_cursor = true,
				indent_size = 0,
			},
			renderers = {
				file = {
					{ "indent" },
					{ "icon" },
					{ "name" },
				},
				directory = {
					{ "indent" },
					{ "icon" },
					{ "expander" },
					{ "name" },
				},
				document_symbols = {
					{ "name", right_padding = 0 },
				},
			},
			window = {
				position = "right",
				mappings = {
					["P"] = {
						"toggle_preview",
						config = {
							use_float = false,
						},
					},
				},
			},
		})

		vim.keymap.set("n", "<C-m>", ":Neotree filesystem reveal toggle current<CR>", {})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {})
		vim.keymap.set("n", "<leader>f", ":Neotree focus<CR>", { noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>p",
			":Neotree document_symbols reveal toggle current<CR>",
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>o",
			":Neotree document_symbols reveal toggle right<CR>",
			{ noremap = true, silent = true }
		)

		vim.opt.fillchars = { eob = " " }

		set_neotree_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = set_neotree_highlights,
		})
	end,
}
