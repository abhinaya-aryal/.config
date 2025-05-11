return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local diff = {
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
    }


    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = "󰋼 " },
    }

    local filename = {
      "filename",
      path = 4,
      symbols = {
        modified = "󰷈",
        readonly = "󰌾",
      },
    }

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
        disabled_filetypes = { "alpha", "lazy", "TelescopePrompt"}, -- "toggleterm"
        icons_enabled = true,
        colored = true,
      },
      sections = {
        lualine_a = { "mode", {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ffffff", gui = "bold" }
        } },
        lualine_b = { "branch", diff },
        lualine_c = { "lsp_status", diagnostics },
        lualine_x = { filename, "filesize" },
        lualine_y = { "location" },
        lualine_z = { progress },
      },
    })
  end,
}
