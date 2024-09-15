return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        ["*"] = { "typos" },
        ["_"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 500,
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
