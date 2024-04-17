if vim.g.renamid then
  return
end

vim.g.renamid = 1

vim.api.nvim_create_user_command('Renamid', 'lua require("renamid.core").rename()', {})
