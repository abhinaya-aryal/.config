return {
	"lewis6991/gitsigns.nvim",
	event = { "BufAdd" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- NOTE: Jump to the next hunk in current buffer
				map("n", "nh", function()
					if vim.wo.diff then
						return "nh"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- NOTE: Jump to the previous hunk in the current buffer
				map("n", "ph", function()
					if vim.wo.diff then
						return "ph"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "<leader>rb", gs.reset_buffer) -- Reset all the unstaged changes back.
				map("n", "<leader>sh", gs.stage_hunk) -- Stage the hunk at the cursor position.
				map("v", "<leader>sh", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- Stage hunk in visual mode
				end)
				map("n", "<leader>uh", gs.undo_stage_hunk) -- Undo the last call of stage_hunk() in the current session.
				map("n", "<leader>vh", gs.preview_hunk) -- Preview the hunk at the cursor position in a floating window.
				map(
					"n",
					"<leader>bl",
					function() -- Run git blame on the current line and show the results in a floating window
						gs.blame_line({ full = true })
					end
				)
				map("n", "<leader>sb", gs.stage_buffer) -- Stage all hunks in current buffer
				map("n", "<leader>ub", gs.reset_buffer_index) -- Unstage all hunks for current buffer in the index.
				map("n", "<leader>dt", gs.diffthis) -- Perform a vimdiff on the given file with {base}. Change base using :Gitsigns change_base <base>
				map("n", "<leader>td", gs.toggle_deleted) -- toggle to show the deleted lines
			end,
		})
	end,
}
