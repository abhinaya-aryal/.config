return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown", "md" },
	config = function()
		vim.fn["mkdp#util#install"]()
	end,
}
