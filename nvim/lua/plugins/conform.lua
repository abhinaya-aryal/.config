return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        ["*"] = { "codespell" },
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
