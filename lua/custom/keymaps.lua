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

vim.keymap.set('n', '<F5>', function()
  local is_windows = vim.fn.has 'win32' == 1
  local build_dir = 'build'

  local exe_path = nil

  if is_windows then
    local files = vim.fn.glob(build_dir .. '/*.exe', false, true)
    if #files > 0 then exe_path = files[1] end
  else
    local files = vim.fn.glob(build_dir .. '/*', false, true)
    for _, file in ipairs(files) do
      if vim.fn.executable(file) == 1 and vim.fn.isdirectory(file) == 0 then
        exe_path = file
        break
      end
    end
  end

  if exe_path then
    vim.notify('Starting ' .. exe_path .. '...', vim.log.levels.INFO)

    if is_windows then
      vim.fn.jobstart('.\\' .. exe_path:gsub('/', '\\'))
    else
      vim.fn.jobstart('./' .. exe_path)
    end
  else
    vim.notify('No executable or run script found.', vim.log.levels.WARN)
  end
end, { desc = 'Run compiled project' })
