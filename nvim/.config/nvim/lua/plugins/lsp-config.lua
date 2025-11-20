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
			local util = require("lspconfig.util")

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

			local eslint_or_prettier = util.root_pattern(
				"eslint.config.js",
				"eslint.config.ts",
				"eslint.config.mjs",
				"eslint.config.cjs",
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.json",
				".eslintrc.yml",
				".eslintrc.yaml",
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.js",
				".prettierrc.cjs",
				"prettier.config.js",
				"prettier.config.ts",
				"prettier.config.cjs"
			)

			lspconfig.biome.setup({
				cmd = { "biome", "lsp-proxy" },
				root_dir = function(fname)
					local has_ep = eslint_or_prettier(fname)
					if has_ep then
						return nil
					end
					return util.root_pattern("biome.json", "package.json", "tsconfig.json", ".git")(fname)
				end,
				single_file_support = false,
				filetypes = {
					"astro",
					"graphql",
					"javascript",
					"javascriptreact",
					"json",
					"jsonc",
					"svelte",
					"typescript",
					"typescriptreact",
					"vue",
				},
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				root_dir = function(fname)
					local has_ep = eslint_or_prettier(fname)
					if not has_ep then
						return nil
					end
					return util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
				end,
				single_file_support = false,
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
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

			lspconfig.glsl_analyzer.setup({
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
