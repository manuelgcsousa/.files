return {
  "saghen/blink.cmp",
  version = '1.*',
  opts = {
    keymap = {
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's
      use_nvim_cmp_as_default = true,

      -- use 'mono' nerd-font
      nerd_font_variant = "mono"
    },

    sources = {
      default = { "lsp", "path", "buffer" },
    },

    cmdline = { enabled = false },

    completion = {
      list = { selection = { auto_insert = true } },
      menu = { border = "none" },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
    },
  },

  opts_extend = { "sources.default" }
}
