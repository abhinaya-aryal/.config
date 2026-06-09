vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" })

require("nvim-ts-autotag").setup({
	opts = {
		enable_close_on_slash = false,
	},
})
