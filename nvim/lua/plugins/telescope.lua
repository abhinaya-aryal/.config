return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
  },
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")
    local fb_actions = require("telescope._extensions.file_browser.actions")
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { width = 0.85, height = 0.85 },
        dynamic_preview_title = true,
        mappings = {
          ["i"] = {
            ["<esc>"] = actions.close,
            ["J"] = actions.move_selection_next,
            ["K"] = actions.move_selection_previous,
            ["V"] = actions.select_vertical,
            ["O"] = actions.select_horizontal,
            ["D"] = actions.preview_scrolling_down,
            ["U"] = actions.preview_scrolling_up,
            ["<C-t>"] = false,
          },
          ["n"] = {
            ["q"] = actions.close,
            ["v"] = actions.select_vertical,
            ["o"] = actions.select_horizontal,
            ["d"] = actions.preview_scrolling_down,
            ["u"] = actions.preview_scrolling_up,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            ["i"] = {
              ["D"] = actions.delete_buffer + actions.move_to_top,
            },
            ["n"] = {
              ["d"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
      extensions = {
        file_browser = {
          cwd_to_path = true,
          hijack_netrw = true,
          no_ignore = true,
          mappings = {
            ["n"] = {
              ["c"] = fb_actions.create,
              ["r"] = fb_actions.rename,
              ["m"] = fb_actions.move,
              ["y"] = fb_actions.copy,
              ["d"] = fb_actions.remove,
              ["o"] = fb_actions.open,
              ["b"] = fb_actions.goto_parent_dir,
              ["e"] = fb_actions.goto_home_dir,
              ["w"] = fb_actions.goto_cwd,
              ["s"] = fb_actions.change_cwd,
              ["h"] = fb_actions.toggle_hidden,
              ["t"] = fb_actions.toggle_all,
            },
            ["i"] = {
              ["C"] = fb_actions.create,
              ["R"] = fb_actions.rename,
              ["M"] = fb_actions.move,
              ["Y"] = fb_actions.copy,
              ["D"] = fb_actions.remove,
              ["O"] = fb_actions.open,
              ["B"] = fb_actions.goto_parent_dir,
              ["E"] = fb_actions.goto_home_dir,
              ["W"] = fb_actions.goto_cwd,
              ["S"] = fb_actions.change_cwd,
              ["H"] = fb_actions.toggle_hidden,
              ["T"] = fb_actions.toggle_all,
              ["<bs>"] = false,
            },
          },
        },
      },
    })
    require("telescope").load_extension("file_browser")
  end,
  keys = {
    { "<leader>tt", "<cmd>Telescope<cr>",              desc = "Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find File" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>",    desc = "Find text in cwd" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>",  desc = "Search string under cursor" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "Browse Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Find Buffer" },
  },
}
