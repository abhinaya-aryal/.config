return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      map_c_h = true,  -- map the <C-h> key to delete a pair
      check_ts = true,
      fast_wrap = {
        map = "<C-e>",
        chars = { "(", "[", "{", '"', "'" },
        pattern = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
      },
      ts_config = {
        lua = { "string", "comment" },
        javascript = { "template_string" },
      },
    })
  end,
}
