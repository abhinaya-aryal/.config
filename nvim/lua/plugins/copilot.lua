return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    vim.g.copilot_no_tab_map = true

    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Dismiss()', { expr = true, silent = true })
  end,
}
