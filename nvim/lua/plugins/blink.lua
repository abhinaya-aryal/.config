vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")
cmp.build():pwait()

local has_words_before = function()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	if col == 0 then
		return false
	end
	local line = vim.api.nvim_get_current_line()
	return line:sub(col, col):match("%s") == nil
end

cmp.setup({
	keymap = {
		preset = "enter",

		["<Tab>"] = {
			function(menu)
				if has_words_before() then
					return menu.insert_next()
				end
			end,
			"fallback",
		},

		["<S-Tab>"] = { "insert_prev" },
	},

	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		list = { selection = { preselect = false } },
	},
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	cmdline = { completion = { menu = { auto_show = true }, ghost_text = { enabled = true } } },
})
