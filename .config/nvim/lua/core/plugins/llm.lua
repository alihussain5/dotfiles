-- return {
--   'yetone/avante.nvim',
--   event = 'VeryLazy',
--   lazy = false,
--   version = false, -- set this if you want to always pull the latest change
--   opts = {
--     -- add any opts here
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = 'make',
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     'stevearc/dressing.nvim',
--     'nvim-lua/plenary.nvim',
--     'MunifTanjim/nui.nvim',
--     --- The below dependencies are optional,
--     'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
--     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
--     'zbirenbaum/copilot.lua', -- for providers='copilot'
--     {
--       -- support for image pasting
--       'HakonHarnes/img-clip.nvim',
--       event = 'VeryLazy',
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       'MeanderingProgrammer/render-markdown.nvim',
--       opts = {
--         file_types = { 'markdown', 'Avante' },
--       },
--       ft = { 'markdown', 'Avante' },
--     },
--   },
-- }
return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-y>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        disable_inline_completion = true,
      }
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- The following are optional:
      { 'MeanderingProgrammer/render-markdown.nvim', ft = { 'markdown', 'codecompanion' } },
    },
    config = function()
      require('codecompanion').setup {
        strategies = {
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'anthropic',
          },
        },
      }
    end,
  },
}
