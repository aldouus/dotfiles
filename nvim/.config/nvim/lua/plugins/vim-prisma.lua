return {
	"prisma/vim-prisma",
	ft = { "prisma" },
	config = function()
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.prisma",
			callback = function()
				vim.bo.filetype = "prisma"
			end,
		})
	end,
}
