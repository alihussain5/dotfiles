-- Neo-tree configuration
require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['<leader>e'] = 'close_window',
        ['m'] = {
          'move',
          config = {
            show_path = 'relative',
          },
        },
        ['c'] = {
          'copy',
          config = {
            show_path = 'relative',
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
}

vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<leader>b', ':Neotree toggle show buffers right<CR>', { desc = 'NeoTree buffers', silent = true })
