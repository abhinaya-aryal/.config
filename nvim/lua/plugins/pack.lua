local github = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	github("goolord/alpha-nvim"),
	github("nvim-tree/nvim-web-devicons"),
	github("windwp/nvim-autopairs"),
	github("windwp/nvim-ts-autotag"),
	github("famiu/bufdelete.nvim"),
	github("hrsh7th/nvim-cmp"),
	github("hrsh7th/cmp-buffer"),
	github("hrsh7th/cmp-path"),
	github("hrsh7th/cmp-cmdline"),
	github("hrsh7th/cmp-nvim-lsp-signature-help"),
	{ src = github("L3MON4D3/LuaSnip"), build = "make install_jsregexp" },
	github("saadparwaiz1/cmp_luasnip"),
	github("rafamadriz/friendly-snippets"),
	github("onsails/lspkind.nvim"),
	github("tzachar/cmp-ai"),
	github("scottmckendry/cyberdream.nvim"),
	github("stevearc/conform.nvim"),
	github("lewis6991/gitsigns.nvim"),
	github("lukas-reineke/indent-blankline.nvim"),
	github("neovim/nvim-lspconfig"),
	github("nvim-lualine/lualine.nvim"),
	github("iamcco/markdown-preview.nvim"),
	github("folke/noice.nvim"),
	github("MunifTanjim/nui.nvim"),
	github("rcarriga/nvim-notify"),
	github("nvim-tree/nvim-tree.lua"),
	github("nvim-telescope/telescope.nvim"),
	github("nvim-lua/plenary.nvim"),
	github("akinsho/toggleterm.nvim"),
	github("abhinaya-aryal/nvim-yt-player"),
})

-- require("alpha")
-- require("autopairs")
-- require("autotag")
-- require("bufdelete")
-- require("cmp")
-- require("colorscheme")
-- require("conform")
-- require("gitsigns")
-- require("indentline")
-- require("lsp")
-- require("lualine")
-- require("markdown")
-- require("noice")
-- require("nvimtree")
-- require("telescope")
-- require("toggleterm")
-- require("ytplayer")
