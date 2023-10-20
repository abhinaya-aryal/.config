return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufAdd",
	dependencies = {
		{ "lukas-reineke/lsp-format.nvim" },
	},
	config = function()
		local null_ls = require("null-ls")
		local b = null_ls.builtins
		local sources = {
			b.code_actions.eslint_d,
			b.diagnostics.editorconfig_checker,
			b.diagnostics.eslint_d,
			b.formatting.prettierd,
			b.formatting.stylua,
			b.formatting.zigfmt,
		}
		null_ls.setup({
			sources = sources,
			on_attach = function(client)
				require("lsp-format").on_attach(client) -- format on save
			end,
		})
	end,
}
