-- Sidekick configuration
require('sidekick').setup {
  cli = {
    mux = {
      backend = 'tmux',
      enabled = false,
    },
  },
}

vim.keymap.set('n', '<tab>', function()
  if not require('sidekick').nes_jump_or_apply() then
    return '<Tab>'
  end
end, { expr = true, desc = 'Goto/Apply Next Edit Suggestion' })

vim.keymap.set({ 'n', 'v' }, '<c-.>', function()
  require('sidekick.cli').focus()
end, { desc = 'Sidekick Switch Focus' })

vim.keymap.set({ 'n', 'v' }, '<leader>aa', function()
  require('sidekick.cli').toggle { name = 'claude', focus = true }
end, { desc = 'Sidekick Toggle CLI' })

vim.keymap.set({ 'n', 'v' }, '<leader>ap', function()
  require('sidekick.cli').select_prompt()
end, { desc = 'Sidekick Ask Prompt' })
