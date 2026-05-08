local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('gdscript', {
  capabilities = capabilities,
})
vim.lsp.enable 'gdscript'

pcall(function() require('nvim-treesitter').install { 'gdscript', 'gdshader' } end)

pcall(function() require('conform').formatters_by_ft.gdscript = { 'gdformat' } end)
