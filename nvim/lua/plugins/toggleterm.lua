return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = 5,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      insert_mapping = true,
      terminal_mappings = true,
      direction = "horizontal",
      close_on_exit = true,
      autochdir = true,
      auto_scroll = true,
      winbar = {
        enabled = true,
      }
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- open floating terminal on <leader>z
    local Terminal = require('toggleterm.terminal').Terminal
    local Floating = Terminal:new({
      hidden = true,
      display_name = "Terminal",
      direction = "float",
      autochdir = true,
      auto_scroll = true,
      float_opts = {
        border = "double",
      },
    })

    function Floating_open()
      if not Floating:is_open() then
        Floating:open()
      end
    end

    vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>lua Floating_open()<CR>", { noremap = true, silent = true })
  end,
}
