return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/.config/wall.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
					height = 17,
					padding = 1,
				},
				{
					pane = 2,
					{ section = "keys", gap = 1, padding = 1 },
				},
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		zen = {
			zoom = {
				toggles = {},
				show = { statusline = true, tabline = true },
				win = {
					backdrop = false,
					width = 0, -- full width
				},
			},
		},
		terminal = { enabled = true },
	},

	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next Reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev Reference",
			mode = { "n", "t" },
		},
		{
			"<leader>jj",
			function()
				local Snacks = require("snacks")
				Snacks.terminal.toggle({ "/opt/homebrew/bin/lazyjj" }, {
					id = "lazyjj-floating",
					win = {
						style = "float",
						border = "rounded",
						height = 0.8,
						width = 0.8,
						title = " lazyjj ",
						title_pos = "center",
					},
					start_insert = true,
					close_on_exit = false,
					cwd = vim.loop.cwd(),
					clear_env = false,
				})
			end,
			desc = "Lazyjj",
		},
	},
}
