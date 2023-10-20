return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup({})
	end,
	cmd = "Telescope",
	keys = {
		{ "<leader>ot", "<cmd>Telescope<cr>", desc = "Telescope" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
		{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find text in cwd" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Files" },
		{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Search string under cursor" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "List vim options" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
		{ "<leader>fc", "<cmd>TodoTelescope<cr>", desc = "Find Todo Comments" },
	},
}
