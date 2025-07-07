-- ============================================================================
-- OPTIONS
-- ============================================================================

vim.opt.syntax = "on"                                     -- enables syntax highlighting
vim.opt.mouse = "a"                                       -- enables mouse support in all modes
vim.opt.encoding = "utf8"                                 -- sets the file encoding to UTF-8
vim.opt.ffs = { "unix", "dos", "mac" }                    -- file formats
vim.opt.clipboard = "unnamedplus"                         -- use the system clipboard
vim.opt.hidden = true                                     -- switch between unsaved buffers
vim.opt.number = true                                     -- shows line numbers
vim.opt.relativenumber = true                             -- shows relative line numbers
vim.opt.backspace = "2"                                   -- 2 space backspace
vim.opt.expandtab = true                                  -- converts tabs to spaces
vim.opt.tabstop = 4                                       -- <Tab> = 4 spaces
vim.opt.softtabstop = 4                                   -- <Tab> (in insert mode) = 4 spaces
vim.opt.shiftwidth = 4                                    -- number of spaces in auto-indents
vim.opt.scrolloff = 10                                    -- keeps 10 lines visible above and below the cursor
vim.opt.incsearch = true                                  -- highlights match while searching
vim.opt.hlsearch = true                                   -- highlights all matches for previous searches
vim.opt.splitright = true                                 -- opens new vertical splits to the right
vim.opt.splitbelow = true                                 -- opens new horizontal splits below
vim.opt.ruler = true                                      -- displays the cursor position and status at the bottom
vim.opt.wildmenu = true                                   -- provides a graphical interface for the command-line
vim.opt.completeopt = { "menuone", "noselect" }           -- completion options for menu style and behavior
vim.opt.signcolumn = "yes"                                -- always show the sign column for diagnostics
vim.opt.viminfo = ""                                      -- clears viminfo file on exit
vim.opt.showtabline = 0                                   -- hides tabline
vim.opt.cursorline = true                                 -- highlights current line
vim.opt.laststatus = 3                                    -- always show status line
vim.opt.showmode = false                                  -- hide mode display
vim.opt.swapfile = false                                  -- disable swap file
vim.opt.errorbells = false                                -- disable error bells
vim.opt.termguicolors = true                              -- enables 24-bit RGB color in the terminal
vim.opt.undofile = true                                   -- persistent undo
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")  -- undo directory
vim.opt.fillchars = {
  eob = " ",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft  = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
vim.cmd[[
set list
set listchars+=trail:·
]]


-- ============================================================================
-- FILETYPE SETTINGS
-- ============================================================================

local filetype_settings = {
  ["lua"]        = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["sh"]         = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["html"]       = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["javascript"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["typescript"] = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["json"]       = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["nix"]        = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["sql"]        = { tabstop = 4, softtabstop = 4, shiftwidth = 4 },
  ["terraform"]  = { tabstop = 2, softtabstop = 2, shiftwidth = 2 },
  ["go"]         = { expandtab = false, tabstop = 4, softtabstop = 4, shiftwidth = 4 },
  ["makefile"]   = { expandtab = false, tabstop = 4, softtabstop = 4, shiftwidth = 4 },
}

for filetype, settings in pairs(filetype_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      for key, value in pairs(settings) do
        vim.bo[key] = value
      end
    end,
  })
end


-- ============================================================================
-- MAPPINGS
-- ============================================================================

vim.g.mapleader = ","

-- quick save // force buffer quit // jump to previous buffer
vim.keymap.set("n", "<Leader>w", ":w<CR><Space><Left>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>Q", ":bdelete!<CR>",       { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>b", ":b#<CR>",             { noremap = true, silent = true })

-- yank to EOL
vim.keymap.set("n", "Y", "y$")

-- clear search highlights
vim.keymap.set("n", "<Leader>c", ":noh<CR>", { noremap = true, silent = true })

-- shift left/right without leaving visual mode
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- move selected line/block of text in visual mode
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { silent = true })

-- print absolute path of current file
vim.keymap.set("n", "<Leader>fp", "<cmd>lua print(vim.fn.expand('%:p'))<CR>", { noremap = true, silent = true })

-- format JSON (file | visual selection) with 'jq'
vim.keymap.set("n", "<Leader>jq", ":%!jq<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<Leader>jq", "!jq .<CR>", { noremap = true, silent = true })
