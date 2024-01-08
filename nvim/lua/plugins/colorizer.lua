return {
	"NvChad/nvim-colorizer.lua",
	ft = { "config", "css" },
	config = function()
		require("colorizer").setup({
			user_default_options = {
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				sass = { enable = true, parsers = { "css" } },
			},
		})
	end,
}
