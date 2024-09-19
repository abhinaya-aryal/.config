return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local diff = {
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local function activeLsp()
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      for _, client in ipairs(clients) do
        if client.config and client.config.filetypes and vim.tbl_contains(client.config.filetypes, buf_ft) then
          return client.name
        end
      end
      return ""
    end

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = "󰋼 " },
    }

    local filename = {
      "filename",
      path = 0,
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
        disabled_filetypes = { "alpha", "lazy", "TelescopePrompt", "toggleterm" },
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
        lualine_c = { activeLsp, diagnostics },
        lualine_x = { filename, "filesize" },
        lualine_y = { "location" },
        lualine_z = { progress },
      },
    })
  end,
}
