return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local function on_attach(client, bufnr)
				if
					client.server_capabilities.semanticTokensProvider
					and client.server_capabilities.semanticTokensProvider.full
				then
					vim.lsp.semantic_tokens.start(bufnr, client.id)
				end
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			end

			lspconfig.biome.setup({
				cmd = { "biome", "lsp-proxy" },
				filetypes = {
					"astro",
					"graphql",
					"javascript",
					"javascriptreact",
					"json",
					"jsonc",
					"svelte",
					"typescript",
					"typescript.tsx",
					"typescriptreact",
					"vue",
				},
				root_dir = function()
					return vim.fn.getcwd()
				end,
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					on_attach(client, bufnr)
				end,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					on_attach(client, bufnr)
				end,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern(
						"assets/tailwind.config.ts",
						"assets/tailwind.config.js",
						"assets/tailwind.config.cjs",
						"assets/package.json",
						".git"
					)(fname) or vim.fn.getcwd()
				end,
				filetypes = {
					"css",
					"scss",
					"sass",
					"html",
					"heex",
					"elixir",
					"eelixir",
					"eruby",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ 'class[:]\\s*"([^"]*)"', 1 },
								{ '~H"([^"]*)"', 1 },
								'~H""".*class="([^"]*)".*"""',
								'~F""".*class="([^"]*)".*"""',
							},
						},
						includeLanguages = {
							elixir = "html-eex",
							eelixir = "html-eex",
							heex = "html-eex",
						},
						validate = true,
					},
				},
				init_options = {
					userLanguages = {
						elixir = "phoenix-heex",
						eelixir = "phoenix-heex",
						heex = "phoenix-heex",
					},
				},
				on_attach = on_attach,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.intelephense.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.ols.setup({
				cmd = { "ols" },
				filetypes = { "odin" },
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
					on_attach(client, bufnr)
				end,
			})
		end,
	},
}
