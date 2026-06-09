vim.pack.add({ "https://github.com/scottmckendry/cyberdream.nvim" })

require("cyberdream").setup({
	transparent = true,
	italic_comments = true,
	borderless_pickers = false,
})
vim.cmd.colorscheme("cyberdream")
