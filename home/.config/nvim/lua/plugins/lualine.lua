return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = { white = "#C6C6C6", grey = "#262626" }
    local section_theme = {
      a = { fg = colors.white, bg = colors.grey, gui = "bold" },
      b = { fg = colors.white, bg = colors.grey },
    }

    require("lualine").setup({
      options = {
        theme = {
          normal = section_theme,
          insert = section_theme,
          visual = section_theme,
          replace = section_theme
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str) return str:sub(1, 3) end
          }
        },
        lualine_b = { { "filename", path = 3 } },
        lualine_c = { },
        lualine_x = { "branch" },
        lualine_y = { "location" },
        lualine_z = { "progress" }
      },
      tabline = {},
      extensions = {},
    })
  end
}
