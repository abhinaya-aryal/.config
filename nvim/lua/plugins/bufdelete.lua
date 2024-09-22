return {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  config = function()
    local buffer_timers = {}

    local function delete_inactive_buffer(bufnr)
      if vim.api.nvim_buf_is_valid(bufnr) then
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        if vim.fn.buflisted(bufnr) == 1 and vim.api.nvim_buf_is_loaded(bufnr) and not vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
          require("bufdelete").bufwipeout(bufnr, true);
          vim.notify("Buffer " .. buf_name .. " deleted.", vim.log.levels.INFO)
        end
      end
    end

    vim.api.nvim_create_autocmd("BufLeave", {
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        if vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == "" then
          if not buffer_timers[bufnr] then
            local timer = vim.uv.new_timer()
            buffer_timers[bufnr] = timer
            timer:start(180000, 0, vim.schedule_wrap(function()
              delete_inactive_buffer(bufnr)
              timer:stop()
              timer:close()
              buffer_timers[bufnr] = nil
            end))
          end
        end
      end
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if buffer_timers[buf] then
          buffer_timers[buf]:stop()
          buffer_timers[buf]:close()
          buffer_timers[buf] = nil
        end
      end
    })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        for _, timer in pairs(buffer_timers) do
          timer:stop()
          timer:close()
        end
      end
    })
  end
}
