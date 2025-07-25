return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  ---@module "conform"
  opts = {
    formatters_by_ft = {
      ["*"] = { "typos" },
      ["_"] = { "trim_whitespace" },
      lua = { "stylua" },
      zig = { "zigfmt" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      graphql = { "prettier" },
      markdown = { "prettier" },
      md = { "prettier" }
    },
    format_on_save = { timeout_ms = 1500, lsp_format = "fallback" },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
