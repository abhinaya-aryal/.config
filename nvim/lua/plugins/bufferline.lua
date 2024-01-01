return {
	"akinsho/bufferline.nvim",
	event = "BufEnter",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false,
				offsets = { { filetype = "NvimTree", text = "File Explorer" } },
				separator_style = "thin",
			},
		})
	end,
}
