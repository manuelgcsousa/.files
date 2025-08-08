return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- keymaps
    vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

    -- setup
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      update_cwd = true,
      update_focused_file = { enable = true },
      view = {
        width = 45,
        side = "left",
      },
      renderer = { indent_markers = { enable = true } },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "<C-e>", api.tree.close, opts("Close"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end
    })
  end
}
