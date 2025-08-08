return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- set header
    dashboard.section.header.val = {
      "                                                    ",
      " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    }

    -- set buttons
    dashboard.section.buttons.val = {
      dashboard.button("e",   "  New file",  ":ene <BAR> startinsert<CR>"),
      dashboard.button("C-f", "󰈞  Find file", ""),
      dashboard.button("C-g", "󰈬  Find word", ""),
      dashboard.button("c",   "  Config",    ":e $HOME/.config/nvim/<CR>"),
      dashboard.button("q",   "  Quit",      ":qa<CR>"),
    }

    -- add footer
    dashboard.section.footer.val = { "manuelgcsousa.github.io" }

    -- center the dashboard
    dashboard.opts.layout = {
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- setup
    alpha.setup(dashboard.opts)
  end
}
