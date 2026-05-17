vim.keymap.set('n', '<F5>', function()
  vim.notify('Running odin run src...', vim.log.levels.INFO)
  vim.cmd '!odin run src -debug'
end, { buffer = true, desc = 'Run Odin Project' })
