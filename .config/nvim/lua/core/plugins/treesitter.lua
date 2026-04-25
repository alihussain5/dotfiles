-- Treesitter configuration (new main branch API for Neovim 0.12+)
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Install parsers (replaces ensure_installed)
require('nvim-treesitter').install {
  'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc',
  'javascript', 'typescript', 'tsx', 'css', 'json', 'yaml', 'prisma',
}

-- Enable highlighting (replaces highlight.enable = true)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Enable indentation (replaces indent.enable = true)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-indent', { clear = true }),
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- TreeSJ: split/join blocks
require('treesj').setup {}
vim.keymap.set('n', '<space>m', require('treesj').toggle, { desc = 'TreeSJ: Toggle' })
vim.keymap.set('n', '<space>j', require('treesj').join, { desc = 'TreeSJ: Join' })
vim.keymap.set('n', '<space>s', require('treesj').split, { desc = 'TreeSJ: Split' })

-- nvim-treesitter-context: show context of current code block
require('treesitter-context').setup { mode = 'cursor', max_lines = 3, multiline_threshold = 1 }
