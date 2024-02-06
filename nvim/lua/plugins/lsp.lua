return {
	"neovim/nvim-lspconfig",
	event = { "FileType" },
	config = function()
		local on_attach = function(_, bufnr) -- ignored parameter is 'client'
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
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Zig language server
		require("lspconfig").zls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Lua language server specifically for nvim setup
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
					diagnostics = {
						globals = { "vim", "mp" },
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Language server for markdown files
		require("lspconfig").marksman.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
}
