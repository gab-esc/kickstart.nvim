vim.keymap.set('n', '<leader>b', function()
  if vim.fn.filereadable 'build.bat' == 1 then
    vim.notify('Running build.bat...', vim.log.levels.INFO)
    vim.cmd '!.\\build.bat'
  else
    vim.notify('No build.bat found in the current directory.', vim.log.levels.WARN)
  end
end, { desc = 'Run [B]uild.bat' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'odin',
  callback = function(event)
    vim.keymap.set('n', '<F5>', function()
      vim.notify('Running odin run src...', vim.log.levels.INFO)
      vim.cmd '!odin run src -debug'
    end, { buffer = event.buf, desc = 'Run Odin Project' })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gdscript',
  callback = function(event)
    vim.keymap.set('n', '<F5>', function()
      vim.notify('Running Godot project...', vim.log.levels.INFO)
      vim.cmd '!godot'
    end, { buffer = event.buf, desc = 'Run Godot Project' })

    vim.keymap.set('n', '<F6>', function()
      vim.notify('Running current scene...', vim.log.levels.INFO)
      local current_file = vim.fn.expand '%p'
      local scene_file = current_file:gsub('%.gd$', '.tscn')
      vim.cmd('!godot ' .. scene_file)
    end, { buffer = event.buf, desc = 'Run Current Godot Scene' })
  end,
})

-- Ink Keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ink',
  callback = function(event)
    vim.keymap.set('n', '<F5>', function()
      vim.notify('Running Inklecate...', vim.log.levels.INFO)
      -- Opens a terminal split at the bottom, runs the game, and enters insert mode
      vim.cmd('vsplit | terminal inklecate -p ' .. vim.fn.expand '%:p')
      vim.cmd 'startinsert'
    end, { buffer = event.buf, desc = 'Play Ink Story' })
  end,
})
