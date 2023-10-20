return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", hint = " ", info = "󰋼 " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filetype = {
			"filetype",
			colored = true,
			icons_enabled = true,
		}

		local location = {
			"location",
			padding = 0,
		}

		require("lualine").setup({
			options = {
				globalstatus = true,
				disabled_filetypes = { "alpha", "dashboard" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diagnostics },
				lualine_x = { diff, "filesize", filetype },
				lualine_y = { location },
				lualine_z = { "progress" },
			},
		})
	end,
}
