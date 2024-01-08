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
		-- NOTE: Signs for diagnostics
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		-- NOTE: Rounded border for floats
		-- vim.lsp.handlers["textDocument/hover"] =
		-- vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", title = "hover" })
		-- vim.lsp.handlers["textDocument/signatureHelp"] =
		-- vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", title = "signature" })

		-- NOTE: Diagnostic related global config
		vim.diagnostic.config({
			virtual_text = false,
			float = { border = "rounded" },
			severity_sort = true,
			update_in_insert = false,
		})

		-- NOTE: Setting up shortcuts on attaching the lsp
		local on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp,omnifunc")
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "<leader>rl", vim.lsp.buf.rename, { buffer = bufnr })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snipperSupport = true
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- INFO: Setting up mason
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"zls",
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

			-- NOTE: Setting up special servers individually
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
	end,

	keys = {
		{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
		{ "<leader>i", "<cmd>LspInfo<cr>", desc = "LspInfo" },
	},
}
