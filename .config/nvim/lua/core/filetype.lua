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
