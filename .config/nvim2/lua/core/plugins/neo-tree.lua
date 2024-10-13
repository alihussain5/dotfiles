-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>b', ':Neotree toggle show buffers right<CR>', desc = 'NeoTree buffers', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          ['m'] = {
            'move',
            config = {
              show_path = 'relative', -- "none", "relative", "absolute"
            },
          },
          ['c'] = {
            'copy',
            config = {
              show_path = 'relative', -- "none", "relative", "absolute"
            },
          },
        },
      },
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          '.git',
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {},
      },
    },
    close_if_last_window = true,
  },
}
