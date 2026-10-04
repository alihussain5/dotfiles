-- pi.nvim (pablopunk) configuration
-- Runs pi headless per request with a floating ask UI. No terminal panel.
require('snacks').setup {
  input = {},
  picker = {},
}

vim.o.autoread = true

-- Use vim.notify (routed by noice/snacks to a corner toast) instead of pi.nvim's
-- centered fallback float. pi.nvim only shows the centered box when it can't
-- find a rich notifier; this flag forces the notify backend.
_G.__pi_force_notify_backend = true

require('pi').setup {
  provider = 'github-copilot',
  model = 'claude-haiku-4.5',
  thinking = 'off',
  -- Smaller system prompt = fewer input tokens = faster first token.
  skills = false,
  extensions = false,
  context = {
    max_bytes = 12000,
    ask = { surrounding_lines = 40 },
    selection = { surrounding_lines = 20 },
    diagnostics = { enabled = true },
  },
}

-- Ask pi about the current buffer (opens floating input)
vim.keymap.set('n', '<leader>oa', ':PiAsk<CR>', { desc = 'Pi: ask (buffer)', silent = true })
-- Ask pi about the visual selection
vim.keymap.set('x', '<leader>oa', ':PiAskSelection<CR>', { desc = 'Pi: ask (selection)', silent = true })
-- Cancel the active request
vim.keymap.set('n', '<leader>oq', ':PiCancel<CR>', { desc = 'Pi: cancel', silent = true })
-- Open the session log
vim.keymap.set('n', '<leader>ol', ':PiLog<CR>', { desc = 'Pi: log', silent = true })
