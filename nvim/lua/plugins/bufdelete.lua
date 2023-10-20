-- NOTE: Neovim default :bwipeout will remove buffer as well as mess up with existing window setup
return {
	"famiu/bufdelete.nvim",
	keys = {
		{ "<leader>db", "<cmd>Bwipeout<cr>", desc = "Delete Buffer" },
	},
}
