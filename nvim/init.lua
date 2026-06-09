require("config.options")
require("config.keymaps")

vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rcarriga/nvim-notify",
	"https://github.com/nvim-lua/plenary.nvim",
})

-- Plugins Config
require("plugins.colorscheme")
require("plugins.alpha")
require("plugins.nvimtree")
require("plugins.bufdelete")
require("plugins.autopairs")
require("plugins.autotag")
require("plugins.noice")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.indentline")
require("plugins.markdown")
require("plugins.cmp")
require("plugins.ytplayer")
require("plugins.comment")
require("plugins.tsmanager")

require("config.lsp")
