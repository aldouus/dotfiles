return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local auto = require("lualine.themes.auto")
		local fg = "#a8b1d6"

		local function set(mode)
			auto[mode].a.bg, auto[mode].b.bg, auto[mode].c.bg = nil, nil, nil
			auto[mode].a.fg, auto[mode].b.fg, auto[mode].c.fg = fg, fg, fg
		end

		set("normal")
		set("insert")
		set("visual")
		set("replace")
		set("command")
		set("inactive")

		require("lualine").setup({
			options = { theme = auto },
		})

		require("lualine").setup({
			options = {
				theme = auto,
				icons_enabled = false,
				component_separators = { left = " ", right = " " },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "neo-tree" },
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
