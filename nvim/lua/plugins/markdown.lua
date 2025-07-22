return {
  "iamcco/markdown-preview.nvim",
  event = "VeryLazy",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown", "md" },
  build = ":call mkdp#util#install()",
  config = function()
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 0
  end,
}
