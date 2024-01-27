return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local diagnostics = {
			"diagnostics",
			symbols = { error = " ", warn = " ", hint = " ", info = "󰋼 " },
		}

		local diff = {
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
		}

		local filename = {
			"filename",
			path = 1,
			symbols = {
				modified = "󰷈",
				readonly = "󰌾",
			},
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

		local function progress()
			local cur = vim.fn.line(".")
			local total = vim.fn.line("$")
			if cur == 1 then
				return string.format("Top of %dL", total)
			elseif cur == total then
				return string.format("Bot of %dL", total)
			else
				return string.format("%2d%%%% of %dL", math.floor(cur / total * 100), total)
			end
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
				lualine_x = { filename, "filesize" },
				lualine_y = { "location" },
				lualine_z = { progress },
			},
		})
	end,
}
