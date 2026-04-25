-- Mini.nvim modules
require('mini.ai').setup { n_lines = 500 }
require('mini.surround').setup()
require('mini.starter').setup()
require('mini.diff').setup()

-- NOTE: maybe i'll use mini.statusline again, but trying lualine for now
-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = vim.g.have_nerd_font }
-- statusline.section_location = function()
--   return '%2l:%-2v'
-- end
