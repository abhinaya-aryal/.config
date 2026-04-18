vim.keymap.set("n", "<leader>tt", ":Telescope<CR>", { desc = "Telescope" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = "Find text in cwd" })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>", { desc = "Search String Under Cursor" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffer<CR>", { desc = "Find Buffer" })

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = { width = 0.85, height = 0.85 },
		dynamic_preview_title = true,
		mappings = {
			["n"] = {
				["q"] = actions.close,
				["v"] = actions.select_vertical,
				["s"] = actions.select_horizontal,
				["d"] = actions.preview_scrolling_down,
				["u"] = actions.preview_scrolling_up,
			},
		},
	},
	pickers = {
		buffers = {
			mappings = {
				["n"] = {
					["d"] = actions.delete_buffer + actions.move_to_top,
				},
			},
		},
	},
})
