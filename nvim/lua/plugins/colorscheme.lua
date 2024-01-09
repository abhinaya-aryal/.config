return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "deep", -- dark | darker | deep | cool | warm | warmer
			transparent = true,
			lualine = {
				transparent = true,
			},
		})
		vim.cmd.colorscheme("onedark")
	end,
}
