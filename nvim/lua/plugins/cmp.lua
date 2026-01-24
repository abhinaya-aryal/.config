return {
	"hrsh7th/nvim-cmp",
	event = "ModeChanged",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
		{ "tzachar/cmp-ai" },
	},
	config = function()
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

		require("luasnip.loaders.from_vscode").lazy_load()

		local snippet = require("luasnip")

		local cmp_ai = require("cmp_ai.config")

		cmp_ai:setup({
			max_lines = 10,
			provider = "Ollama",
			provider_options = {
				model = "codegemma:2b-code",
				-- for qwen2.5-coder model
				--[[ prompt = function(lines_before, lines_after)
					return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>"
				end, ]]
				prompt = function(lines_before)
					return lines_before
				end,
				suffix = function(lines_after)
					return lines_after
				end,
			},

			notify = true,
			notify_callback = function(msg)
				vim.notify("AI: " .. msg)
			end,
			run_on_every_keystroke = false,
		})

		local source_mapping = {
			nvim_lsp = "[LSP]",
			nvim_lsp_signature_help = "[Sig]",
			buffer = "[Buffer]",
			path = "[Path]",
			luasnip = "[LuaSnip]",
			cmp_ai = "[AI]",
		}

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					snippet.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
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
				{ name = "cmp_ai" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			formatting = {
				fields = { "abbr", "kind", "menu" }, -- "icon"

				format = function(entry, vim_item)
					vim_item.kind = require("lspkind").symbol_map[vim_item.kind or ""]
					vim_item.menu = source_mapping[entry.source.name]
					return vim_item
				end,
			},
			experimental = {
				ghost_text = true,
			},
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
