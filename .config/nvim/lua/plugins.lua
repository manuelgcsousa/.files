-- ============================================================================
--
-- PLUGINS
-- (using 'lazy.nvim')
--
-- ============================================================================

-- BOOTSTRAP
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable" })
end
vim.opt.rtp:prepend(lazypath)

-- SETUP
require("lazy").setup({

  -- [[ vscode.nvim (colorscheme) ]]
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      local c = require("vscode.colors")

      -- setup
      require("vscode").setup({
        italic_comments = true,

        color_overrides = {
          vscBack = "#181818"
        },

        group_overrides = {
          -- defaults
          CursorLine = { bg = "#262626" },
          CursorLineNr = { fg = "#FFFFFF" },
          ModeMsg = { fg = c.vscFront, bg = "#1C1C1C" },

          -- plugins
          NvimTreeNormal = { bg = "#181818" },
          TelescopePromptBorder = { fg = "#DDDDDD", bg = "NONE" },
          TelescopeResultsBorder = { fg = "#DDDDDD", bg = "NONE" },
          TelescopePreviewBorder = { fg = "#DDDDDD", bg = "NONE" }
        }
      })

      vim.o.background = "dark"
      vim.cmd.colorscheme("vscode")
    end
  },

  -- [[ lualine.nvim ]]
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- setup
      local colors = { white = "#C6C6C6", grey  = "#262626" }
      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { fg = colors.white, bg = colors.grey, gui = "bold" },
              b = { fg = colors.white, bg = colors.grey },
            },
            insert = {
              a = { fg = colors.white, bg = colors.grey, gui = "bold" },
              b = { fg = colors.white, bg = colors.grey },
            },
            visual = {
              a = { fg = colors.white, bg = colors.grey, gui = "bold" },
              b = { fg = colors.white, bg = colors.grey },
            },
            replace = {
              a = { fg = colors.white, bg = colors.grey, gui = "bold" },
              b = { fg = colors.white, bg = colors.grey },
            }
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
          lualine_c = {},
          lualine_x = { "branch" },
          lualine_y = { "location" },
          lualine_z = { "progress" }
        },
        tabline = {},
        extensions = {},
      })
    end
  },

  -- [[ alpha-nvim ]]
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- set header
      dashboard.section.header.val = { "NeoVim" }

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
  },

  -- [[ fzf-lua ]]
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- keymaps
      vim.keymap.set("n", "<C-f>",      ":FzfLua files<CR>",      { noremap = true, silent = true })
      vim.keymap.set("n", "<C-b>",      ":FzfLua buffers<CR>",    { noremap = true, silent = true })
      vim.keymap.set("n", "<C-g>",      ":FzfLua live_grep<CR>",  { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>gs", ":FzfLua git_status<CR>", { noremap = true, silent = true })
    end
  },

  -- [[ nvim-tree.lua ]]
  {
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
        update_focused_file = {
          enable = true
        },
        view = {
          width = 45,
          side = "left",
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
        },
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
    end,
  },

  -- [[ nvim-treesitter ]]
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",  -- sets main module to use for opts
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
  },

  -- [[ gitsigns.nvim ]]
  {
    "lewis6991/gitsigns.nvim",
    config = function()
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

        on_attach = on_attach
      })
    end
  },

  -- [[ vim-surround ]]
  {
    "tpope/vim-surround",
    lazy = false
  },

  -- [[ nvim-autopairs ]]
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- [[ nvim-lspconfig ]]
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- LSP setup
      local lsp = require("lspconfig")

      local configs = {
        python = {
          server = "pyright",
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly"
              }
            }
          }
        },
        terraform = {
          server = "terraformls"
        },
        go = {
          server = "gopls"
        },
        lua = {
          server = "lua_ls",
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
              workspace = {
                checkThirdParty = false,
              }
            }
          }
        }
      }

      local custom_float_border = function()
        return {
          {"🭽", "FloatBorder"},
          {"▔", "FloatBorder"},
          {"🭾", "FloatBorder"},
          {"▕", "FloatBorder"},
          {"🭿", "FloatBorder"},
          {"▁", "FloatBorder"},
          {"🭼", "FloatBorder"},
          {"▏", "FloatBorder"},
        }
      end

      for _, config in pairs(configs) do
        lsp[config.server].setup({
          settings = config.settings or {},
          handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = custom_float_border() }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = custom_float_border() }),
          }
        })
      end

      -- Handlers setup
      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" }
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = false,
        signs = { active = signs },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          border = custom_float_border()
        }
      })

      -- Mappings
      vim.keymap.set("n", "<Leader>r",  ":FzfLua lsp_references<CR>",               { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>d",  "<cmd>lua vim.lsp.buf.definition()<CR>",    { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>h",  "<cmd>lua vim.lsp.buf.hover()<CR>",         { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>sd", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
    end
  },

  -- [[ conform.nvim ]]
  {
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
  },

  -- [[ nvim-cmp ]]
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim"
    },
    config = function()
      local cmp = require("cmp")

      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end

      cmp.setup{
        mapping = {
          ["<CR>"] = cmp.mapping.confirm{ select = true },

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s"
          }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, {
            "i",
            "s"
          }),

          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "c" }),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "c" })
        },

        formatting = {
          format = require("lspkind").cmp_format({
            with_text = true,
            maxwidth = 50
          })
        },

        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer", keyword_length = 4 }
        },

        window = {
          documentation = {
            border = "single"
          }
        },

        experimental = {
          ghost_text = true
        }
      }
    end
  },

})