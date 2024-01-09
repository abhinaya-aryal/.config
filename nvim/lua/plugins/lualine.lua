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

		local function activeLsp()
			local lsp = "No Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.buf_get_clients()
			if next(clients) == nil then
				return lsp
			end
			for _, client in pairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return lsp
		end

		require("lualine").setup({
			options = {
				globalstatus = true,
				disabled_filetypes = { "alpha", "NvimTree", "lazy", "mason", "TelescopePrompt" },
				icons_enabled = true,
				colored = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", diff, activeLsp },
				lualine_c = { diagnostics },
				lualine_x = { "filename", "filesize" },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
		})
	end,
}
