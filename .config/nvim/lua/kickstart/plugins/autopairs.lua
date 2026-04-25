-- Autopairs
local autopairs = require 'nvim-autopairs'
autopairs.setup {
  check_ts = true,
  enable_check_bracket_line = true,
}

-- nvim-ts-autotag: auto close/rename HTML/JSX tags
require('nvim-ts-autotag').setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
}
