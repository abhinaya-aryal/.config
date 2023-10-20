return {
	"iamcco/markdown-preview.nvim",
	event = "BufAdd",
	ft = { "markdown" },
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
