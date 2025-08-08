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
