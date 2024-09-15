return {
  "neovim/nvim-lspconfig",
  event = { "FileType" },
  config = function()
    local on_attach = function(client, bufnr)
      --enable completion triggerred by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp,omnifunc")

      --Mappings
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)


      if (client.name == "eslint") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll"
        })
      end
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- defining signs for diagnostics
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    -- diagnostic display options
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      float = { border = "rounded" },
      severity_sort = true,
      update_in_insert = false,
    })

    -- Zig language server
    require("lspconfig").zls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Lua language server specifically for nvim config
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          diagnostics = {
            globals = { "vim", "mp" },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- C/C++ language server
    require("lspconfig").clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Typescript language server
    require("lspconfig").ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Tailwindcss language server
    require("lspconfig").tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Eslint
    require("lspconfig").eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
