-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'producdevity/wakatime.nvim',
    lazy = false,
    opts = {
      debug = false, -- Enable for verbose logging if needed
      -- Other configuration options can be set here
    },
  },
  {
    'andweeb/presence.nvim',
  },
}
