return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			transparent_mode = false,
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
