-- ============================================================================
-- MAPPINGS
-- ============================================================================

vim.g.mapleader = ","

-- quick save // force buffer quit // jump to previous buffer
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })
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

-- copy file name and its contents with START and END markers
vim.api.nvim_create_user_command("CopyFileNameAndContents", function()
  local file_name = vim.fn.expand("%:t")
  local file_contents = vim.fn.getline(1, '$')

  if file_name == "" then
    file_name = "<buffer>"
  end

  local text_to_copy = string.format(
    "### START %s ###\n\n%s\n\n### END %s ###",
    file_name,
    table.concat(file_contents, "\n"),
    file_name
  )

  vim.fn.setreg("+", text_to_copy)
  print("Copied to clipboard: " .. file_name)
end, {})
