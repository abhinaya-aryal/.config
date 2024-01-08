return {
	"SmiteshP/nvim-navic",
	event = "VeryLazy",
	config = function()
		require("nvim-navic").setup({
			lsp = {
				auto_attach = true,
			},
		})
		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}
