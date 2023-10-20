return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufAdd", "BufNewFile" },
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"html",
				"markdown",
				"markdown_inline",
				"css",
				"typescript",
				"javascript",
				"tsx",
				"zig",
				"regex",
			},
			auto_install = true,
			sync_install = false,

			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			indent = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
