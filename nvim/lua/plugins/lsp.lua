return {
	"williamboman/mason.nvim",
	event = { "BufAdd" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "b0o/schemastore.nvim" },
	},
	config = function()
		local on_attach = require("config.handlers").on_attach
		local capabilities = require("config.handlers").capabilities
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		-- INFO: Setting up mason
		require("mason-lspconfig").setup({
			ensure_installed = {
				"zls",
				"bashls",
				"lua_ls",
			},
			automatic_installation = true,
		})

		-- INFO: Automatic setting up installed lsps from mason
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,

			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							-- Do not send telemetry data containing a randomized but unique identifier
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			["jsonls"] = function()
				require("lspconfig").jsonls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				})
			end,
			["cssls"] = function()
				require("lspconfig").cssls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						css = {
							lint = {
								validProperties = { "composes" },
							},
						},
					},
				})
			end,
		})
		-- INFO: Calling setup function from handler file of config directory
		require("config.handlers").setup()
	end,
	keys = {
		{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		{ "<leader>i", "<cmd>LspInfo<cr>", desc = "LspInfo" },
	},
}
