return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local lazy = require("lazy")
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
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			dashboard.button("z", "鈴" .. " Lazy", ":Lazy<CR>"),
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

		-- close and re-open lazy after showing alpha
		if vim.o.filetype == "lazy" then
			vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "lazy.nvim" })
			vim.cmd.close()
			require("alpha").setup(dashboard.opts)
			lazy.show()
		else
			require("alpha").setup(dashboard.opts)
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = lazy.stats()
				local ms = math.floor(stats.startuptime + 0.5) -- round off
				local version = " v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
				local fortune = require("alpha.fortune")
				local quote = table.concat(fortune(), "\n")
				local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				local footer = "\t\t" .. version .. "\t" .. plugins .. "\n" .. quote
				dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
