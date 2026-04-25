-- Custom plugins configuration

-- nvim-ufo (code folding)
require('ufo').setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
}

-- {
--   'j-hui/fidget.nvim',
--   opts = {
--     progress = {
--       display = {
--         done_ttl = 5,
--       },
--     },
--   },
-- },

-- Noice
require('noice').setup {}

-- vim-tmux-navigator: no setup needed, just keymaps
vim.keymap.set('n', '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>')

-- Lualine
require('lualine').setup {
  options = {
    theme = 'auto',
    globalstatus = true,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
}

-- {
--   'utilyre/barbecue.nvim',
--   ...
-- },

-- Dropbar
local dropbar_api = require 'dropbar.api'
vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

require('dropbar').setup {
  icons = {
    separators = {
      display = ' > ',
    },
  },
}

-- nvim-highlight-colors
require('nvim-highlight-colors').setup {}

-- nvim-window-picker
require('window-picker').setup()

-- nvim-early-retirement
require('early-retirement').setup {}
