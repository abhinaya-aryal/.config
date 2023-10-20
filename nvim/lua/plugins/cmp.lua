return {
	"hrsh7th/nvim-cmp",
	event = "ModeChanged",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "tzachar/cmp-tabnine", build = "./install.sh" },
		{ "petertriho/cmp-git" },
		{ "jcha0713/cmp-tw2css" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
	},
	config = function()
		-- INFO:This relates to the luasnip and friendly-snippets plugin
		require("luasnip.loaders.from_vscode").lazy_load()
		-- INFO: Used in multiple place so placed in local variable
		local snippet = require("luasnip")
		-- INFO: local variable used in formatting attribute of cmp setup
		local source_mapping = {
			buffer = "[Buffer]",
			nvim_lsp = "[LSP]",
			nvim_lua = "[Lua]",
			cmp_tabnine = "[TN]",
			path = "[Path]",
			luasnip = "[Snippet]",
		}

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

		-- INFO: configuration for tabnine color in completion popup
		vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#6CC644" })

		-- INFO: real configuration cmp
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					snippet.lsp_expand(args.body) -- for 'luasnip' users
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<c-j>"] = cmp.mapping.select_next_item(),
				["<c-k>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm(
					{ select = true, behavior = cmp.ConfirmBehavior.Insert },
					{ "i", "s", "c" }
				),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif snippet.expandable() then
						snippet.expand()
					elseif snippet.expand_or_jumpable() then
						snippet.expand_or_jump()
					elseif check_backspace() then
						cmp.complete()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif snippet.jumpable(-1) then
						snippet.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua" },
				{ name = "cmp_tabnine" },
				{ name = "cmp-tw2css" },
			}),

			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol" })
					vim_item.menu = source_mapping[entry.source.name]
					if entry.source.name == "cmp_tabnine" then
						local detail = (entry.completion_item.labelDetails or {}).detail
						vim_item.kind = ""
						if detail and detail:find(".*%%.*") then
							vim_item.kind = vim_item.kind .. " " .. detail
						end
						if (entry.completion_item.data or {}).multiline then
							vim_item.kind = vim_item.kind .. " " .. "[ML]"
						end
					end
					local maxwidth = 80
					vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
					return vim_item
				end,
			},

			experimental = {
				ghost_text = true,
			},
		})

		-- INFO: set configuration for specific filetype
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- INFO: use buffer source for '/' and '?'
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		--INFO: use cmdline & path source for ":"
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- INFO: to insert '(' after selecting function or method item by nvim-autopairs plugin
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
