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
vim.opt.winborder = "rounded"                             -- border style of floating windows
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
