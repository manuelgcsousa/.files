return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",  -- main module to use for opts
  opts = {
    ensure_installed = {
      "bash", "dockerfile", "go", "html",
      "java", "json", "lua", "make", "python",
      "typescript", "vim", "yaml"
    },
    ignore_install = { "javascript" },
    sync_install = false,
    highlight = {
      enable = true,
      is_supported = function()
        -- disable treesitter if file is bigger than 1MB
        return not (vim.fn.getfsize(vim.fn.expand("%")) > 1024 * 1024)
      end
    }
  }
}
