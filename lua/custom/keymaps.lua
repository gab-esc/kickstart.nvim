vim.keymap.set('n', '<leader>b', function()
  if vim.fn.filereadable 'build.bat' == 1 then
    vim.notify('Running build.bat...', vim.log.levels.INFO)
    vim.cmd '!build.bat'
  else
    vim.notify('No build.bat found in the current directory.', vim.log.levels.WARN)
  end
end, { desc = 'Run [B]uild.bat' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'odin',
  callback = function(event)
    vim.keymap.set('n', '<F5>', function()
      vim.notify('Running odin run src...', vim.log.levels.INFO)
      vim.cmd '!odin run src'
    end, { buffer = event.buf, desc = 'Run Odin Project' })
  end,
})
