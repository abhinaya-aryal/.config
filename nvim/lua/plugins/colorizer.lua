return {
	"NvChad/nvim-colorizer.lua",
	ft = { "css" },
	config = function()
		require("colorizer").setup({
			filetypes = {
				"css",
			},
			user_default_options = {
				css = true,
				css_fn = true,
				tailwind = true,
				sass = { enable = true, parsers = { "css" } },
			},
		})
	end,
}
