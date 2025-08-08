return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup()

    -- keymaps
    vim.keymap.set("n", "<C-f>",      ":FzfLua files<CR>",      { noremap = true, silent = true })
    vim.keymap.set("n", "<C-b>",      ":FzfLua buffers<CR>",    { noremap = true, silent = true })
    vim.keymap.set("n", "<C-g>",      ":FzfLua live_grep<CR>",  { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>gs", ":FzfLua git_status<CR>", { noremap = true, silent = true })
  end
}
