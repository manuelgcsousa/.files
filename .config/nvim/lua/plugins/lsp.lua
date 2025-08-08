-- [[
--   LSP configs: "https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md"
-- ]]

return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local lsp = require("lspconfig")

    -- server configuration
    local servers = {
      ["pyright"] = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },
      ["lua_ls"] = {
        settings = {
          Lua = { workspace = { library = { vim.env.VIMRUNTIME } } },
        },
      },
      ["ts_ls"] = {},
    }
    for server, config in pairs(servers) do
      lsp[server].setup(config)
    end

    -- diagnostics configuration
    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        border = "rounded"
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN]  = "",
          [vim.diagnostic.severity.HINT]  = "",
          [vim.diagnostic.severity.INFO]  = "",
        },
        numhl = {},
        linehl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
          [vim.diagnostic.severity.WARN]  = "DiagnosticLineWarn",
          [vim.diagnostic.severity.HINT]  = "DiagnosticLineHint",
          [vim.diagnostic.severity.INFO]  = "DiagnosticLineInfo",
        },
      }
    })

    -- LSP specific mappings
    vim.keymap.set("n", "<Leader>r",  ":FzfLua lsp_references<CR>",               { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>d",  "<cmd>lua vim.lsp.buf.definition()<CR>",    { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>h",  "<cmd>lua vim.lsp.buf.hover()<CR>",         { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>v",  "<cmd>lua vim.lsp.buf.rename()<CR>",        { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>sd", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
  end
}
