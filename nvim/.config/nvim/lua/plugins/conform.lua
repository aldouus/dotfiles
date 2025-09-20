return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		local function get_formatter(bufnr)
			local filetype = vim.bo[bufnr].filetype
			if filetype == "css" or filetype == "scss" or filetype == "html" then
				return { "prettier" }
			end

			local has_biome = vim.fs.find({ "biome.json" }, { upward = true })[1]
			if has_biome then
				return { "biome" }
			end

			local has_prettier = vim.fs.find({ ".prettierrc" }, { upward = true })[1]
			if has_prettier then
				return { "prettier" }
			end

			return { "biome" }
		end

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = get_formatter,
				javascriptreact = get_formatter,
				typescript = get_formatter,
				typescriptreact = get_formatter,
				css = { "prettier" },
				scss = { "prettier" },
				yml = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				stop_after_first = true,
			},
		})
	end,
}
