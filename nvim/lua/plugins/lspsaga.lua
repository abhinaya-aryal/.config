return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
			},
			code_action = {
				show_server_name = true,
			},
			outline = {
				close_after_jump = true,
			},
		})
	end,
	keys = {
		{ "<leader>lf", "<cmd>Lspsaga finder<cr>", desc = "References & Implementations" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Actions", mode = { "n", "v" } },
		{ "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Lsp Rename" },
		{ "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
		{ "<leader>gd", "<cmd>Lspsaga goto_definition<cr>", desc = "GoTo Definition" },
		{ "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" },
		{ "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Cursor Diagnostics" },
		{ "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer Diagnostics" },
		{ "<leader>jp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to Previous Diagnostics" },
		{ "<leader>jn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to Next Diagnostics" },
		{ "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Toggle Outline" },
		{ "<leader>hd", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
		{ "<leader>pt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
		{ "<leader>gt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go to Type Definition" },
		{ "<leader>tt", "<cmd>Lspsaga term_toggle<cr>", desc = "Cmus Terminal" },
	},
}
