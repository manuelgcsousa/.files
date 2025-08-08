return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local c = require("vscode.colors")

    require("vscode").setup({
      italic_comments = true,

      color_overrides = {
        vscBack = "#181818"
      },

      group_overrides = {
        -- defaults
        CursorLine = { bg = "#1E1E1E" },
        CursorLineNr = { fg = "#FFFFFF" },
        NormalFloat = { bg = "#181818" },
        ModeMsg = { fg = c.vscFront, bg = "#1C1C1C" },

        -- plugins
        NvimTreeNormal = { bg = "#181818" },
        FzfLuaBackdrop = { bg = "#181818" },
        FzfLuaTitleFlags = { bg = "#181818" },
      }
    })

    vim.o.background = "dark"
    vim.cmd.colorscheme("vscode")
  end
}
