return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      map_c_h = true,  -- map the <C-h> key to delete a pair
      check_ts = true, --treesitter integration
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    })
  end,
}
