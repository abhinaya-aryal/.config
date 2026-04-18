local github = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	-- Dependencies
	github("nvim-tree/nvim-web-devicons"),
	github("MunifTanjim/nui.nvim"),
	github("rcarriga/nvim-notify"),
	github("nvim-lua/plenary.nvim"),

	github("scottmckendry/cyberdream.nvim"),
	github("goolord/alpha-nvim"),
	github("nvim-tree/nvim-tree.lua"),
	github("famiu/bufdelete.nvim"),
	github("windwp/nvim-autopairs"),
	github("windwp/nvim-ts-autotag"),
	github("nvim-lualine/lualine.nvim"),
	github("nvim-telescope/telescope.nvim"),
	github("akinsho/toggleterm.nvim"),
	github("folke/noice.nvim"),

	github("stevearc/conform.nvim"),
	github("lewis6991/gitsigns.nvim"),
	github("lukas-reineke/indent-blankline.nvim"),

	{ src = github("iamcco/markdown-preview.nvim"), run = ":call mkdp#util#install()" },

	github("neovim/nvim-lspconfig"),

	-- Completions plugin and dependencies
	github("hrsh7th/nvim-cmp"),
	github("hrsh7th/cmp-nvim-lsp"),
	github("hrsh7th/cmp-buffer"),
	github("hrsh7th/cmp-path"),
	github("hrsh7th/cmp-cmdline"),
	github("hrsh7th/cmp-nvim-lsp-signature-help"),
	{ src = github("L3MON4D3/LuaSnip"), run = "make install_jsregexp" },
	github("saadparwaiz1/cmp_luasnip"),
	github("rafamadriz/friendly-snippets"),
	github("onsails/lspkind.nvim"),
	github("tzachar/cmp-ai"),
	github("hrsh7th/cmp-nvim-lsp"),
	github("hrsh7th/cmp-buffer"),

	github("abhinaya-aryal/nvim-yt-player"),
})
