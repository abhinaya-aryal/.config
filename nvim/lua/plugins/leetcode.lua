return {
	"Dhanus3133/LeetBuddy.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("leetbuddy").setup({ language = "js" })
	end,
	keys = {
		{ "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
		{ "<leader>vq", "<cmd>LBQuestion<cr>", desc = "View Question" },
		{ "<leader>rc", "<cmd>LBReset<cr>", desc = "Reset Code" },
		{ "<leader>tc", "<cmd>LBTest<cr>", desc = "Test Code" },
		{ "<leader>sc", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
	},
}
