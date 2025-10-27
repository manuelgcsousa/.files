return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      -- python = { "ruff_organize_imports", "ruff_format" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "never",
    },
  }
}
