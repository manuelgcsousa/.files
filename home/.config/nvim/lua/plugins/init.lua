-- ============================================================================
-- PLUGINS (using 'lazy.nvim')
-- ============================================================================

-- bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- setup
require("lazy").setup({
  spec = {
    { import = "plugins.colorscheme" },
    { import = "plugins.lualine" },
    { import = "plugins.alpha" },
    { import = "plugins.fzf" },
    { import = "plugins.tree" },
    { import = "plugins.treesitter" },
    { import = "plugins.gitsigns" },
    { import = "plugins.conform" },
    { import = "plugins.completion" },
    { import = "plugins.lsp" },

    { "akinsho/git-conflict.nvim", version = "*", config = true },
    { "tpope/vim-surround", lazy = false },
    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  },

  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
    backdrop = 100,
  },
})
