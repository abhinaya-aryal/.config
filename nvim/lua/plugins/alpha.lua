local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
	button.opts.h1 = "AlphaButtons"
	button.opts.h1_shortcut = "AlphaShortcut"
end

dashboard.section.footer.opts.h1 = "Constant"
dashboard.section.buttons.opts.h1 = "AlphaButtons"
dashboard.section.header.opts.h1 = "AlphaHeader"
dashboard.opts.layout[1].val = 7

require("alpha").setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
	callback = function()
		local version = " v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
		local fortune = require("alpha.fortune")
		local quote = table.concat(fortune(), "\n")
		local footer = "\t\t\t\t\t\t\t\t\t\t" .. version .. "\n" .. quote
		dashboard.section.footer.val = footer
		pcall(vim.cmd.AlphaRedraw)
	end,
})
