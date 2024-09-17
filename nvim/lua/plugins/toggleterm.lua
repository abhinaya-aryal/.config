return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = 2,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      insert_mapping = true,
      terminal_mappings = true,
      direction = "float",
      close_on_exit = true,
      autochdir = true,
      auto_scroll = true,
      float_opts = {
        border = "curved",
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- open lazygit on <leader>z
    local Terminal = require('toggleterm.terminal').Terminal
    local Lazygit = Terminal:new({
      hidden = true,
      cmd = "lazygit",
      display_name = "Lazygit",
      direction = "float",
      dir = "git_dir",
      close_on_exit = true,
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end
    })

    function Lazygit_toggle()
      Lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}
