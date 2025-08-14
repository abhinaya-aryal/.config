return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { width = 0.85, height = 0.85 },
        dynamic_preview_title = true,
        mappings = {
          ["n"] = {
            ["q"] = actions.close,
            ["v"] = actions.select_vertical,
            ["s"] = actions.select_horizontal,
            ["d"] = actions.preview_scrolling_down,
            ["u"] = actions.preview_scrolling_up,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            ["n"] = {
              ["d"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    })
  end,
  keys = {
    { "<leader>tt", "<cmd>Telescope<cr>",             desc = "Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find File" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>",   desc = "Find text in cwd" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Search string under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Find Buffer" },
  },
}
