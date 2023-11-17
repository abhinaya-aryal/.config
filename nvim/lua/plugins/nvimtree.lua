return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeOpen<cr>", desc = "Open NvimTree" },
	},
	config = function()
		local api = require("nvim-tree.api")
		require("nvim-tree").setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "toggleterm", "term" },
			},
			view = {
				side = "right",
			},
			hijack_cursor = true,
			diagnostics = {
				enable = true,
			},
			modified = {
				enable = true,
			},
			renderer = {
				icons = {
					padding = "  ",
					git_placement = "after",
					modified_placement = "before",
				},
				highlight_git = true,
				highlight_modified = "all",
				root_folder_label = ":~:.",
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = true,
				custom = { "node_modules", "yarn.lock" },
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			-- INFO: Use this to set your nvim-tree specific mappings. See nvim-tree-mappings (function or "default")
			on_attach = function(bufnr)
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Set Root"))
				vim.keymap.set("n", "i", api.node.show_info_popup, opts("Info"))
				vim.keymap.set("n", "fr", api.fs.rename_sub, opts("Rename: Omit Filename"))
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
				vim.keymap.set("n", "np", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
				vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
				vim.keymap.set("n", "<C-r>", api.node.run.cmd, opts("Run Command"))
				vim.keymap.set("n", "<bs>", api.tree.change_root_to_parent, opts("Navigate Up"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "bm", api.marks.bulk.move, opts("Move Bookmarked"))
				vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Buffer"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
				vim.keymap.set("n", "gp", api.node.navigate.git.prev, opts("Prev Git"))
				vim.keymap.set("n", "gn", api.node.navigate.git.next, opts("Next Git"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
				vim.keymap.set("n", "e", api.tree.expand_all, opts("Expand All"))
				vim.keymap.set("n", "rb", api.fs.rename_basename, opts("Rename: Basename"))
				vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
				vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "ca", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
				vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
				vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
				vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
				vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
				vim.keymap.set("n", "sy", api.node.run.system, opts("Run System"))
				vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
				vim.keymap.set("n", "z", api.tree.collapse_all, opts("Collapse"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
			end,
		})

		-- INFO: Automattically open newly created file
		api.events.subscribe(api.events.Event.FileCreated, function(file)
			vim.cmd("edit " .. file.fname)
		end)
	end,
}
