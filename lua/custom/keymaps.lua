vim.keymap.set('n', '<leader>b', function()
  if vim.fn.has 'win32' == 1 and vim.fn.filereadable 'build.bat' == 1 then
    vim.notify('Running build.bat...', vim.log.levels.INFO)
    vim.cmd '!.\\build.bat'
  elseif vim.fn.filereadable 'build.sh' == 1 then
    vim.notify('Running build.sh...', vim.log.levels.INFO)
    vim.cmd '!./build.sh'
  else
    vim.notify('No build script found in the current directory.', vim.log.levels.WARN)
  end
end, { desc = 'Run [B]uild script' })
