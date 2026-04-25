-- vim-sleuth: no setup needed, just loading it is enough

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Kanagawa colorscheme (load first)
require('kanagawa').setup {
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = 'none',
        },
      },
    },
  },
}
vim.cmd.colorscheme 'kanagawa-wave'
vim.cmd.hi 'Comment gui=none'

-- Auto dark mode
require('auto-dark-mode').setup {
  set_dark_mode = function()
    vim.api.nvim_set_option_value('background', 'dark', {})
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value('background', 'light', {})
  end,
  update_interval = 3000,
  fallback = 'dark',
}

-- Todo comments
require('todo-comments').setup { signs = false }

-- Diagnostics
vim.diagnostic.config { virtual_text = true }
