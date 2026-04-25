-- OpenCode.nvim configuration
require('snacks').setup {
  input = {},
  picker = {},
}

vim.o.autoread = true

vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
  require('opencode').ask('@this: ', { submit = true })
end, { desc = 'OpenCode: Ask about selection' })

vim.keymap.set({ 'n', 'x' }, '<leader>ox', function()
  require('opencode').select()
end, { desc = 'OpenCode: Select action' })

vim.keymap.set({ 'n', 't' }, '<leader>oo', function()
  require('opencode').toggle()
end, { desc = 'OpenCode: Toggle terminal' })
