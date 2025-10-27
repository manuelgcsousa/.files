return {
  "lewis6991/gitsigns.nvim",
  config = function()
    -- setup
    require("gitsigns").setup({
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align",
        delay = 0,
        ignore_whitespace = false,
      },
    })

    -- mappings
    vim.keymap.set("n", "<Leader>lb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true })
  end
}
