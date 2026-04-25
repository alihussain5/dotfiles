-- Neotest configuration
local neotest = require 'neotest'

neotest.setup {
  adapters = {
    require 'neotest-jest' {
      jestCommand = 'yarn workspace backend test',
      jestConfigFile = function(file)
        if string.find(file, '/') then
          return string.match(file, '(.-/[^/]+/)src') .. 'jest.config.ts'
        end

        return vim.fn.getcwd() .. '/jest.config.ts'
      end,
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    },
  },
}

vim.keymap.set('n', '<leader>j', '', { desc = '+test' })
vim.keymap.set('n', '<leader>jt', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run File (Neotest)' })
vim.keymap.set('n', '<leader>jT', function()
  require('neotest').run.run(vim.uv.cwd())
end, { desc = 'Run All Test Files (Neotest)' })
vim.keymap.set('n', '<leader>jr', function()
  require('neotest').run.run()
end, { desc = 'Run Nearest (Neotest)' })
vim.keymap.set('n', '<leader>jl', function()
  require('neotest').run.run_last()
end, { desc = 'Run Last (Neotest)' })
vim.keymap.set('n', '<leader>js', function()
  require('neotest').summary.toggle()
end, { desc = 'Toggle Summary (Neotest)' })
vim.keymap.set('n', '<leader>jo', function()
  require('neotest').output.open { enter = true, auto_close = true }
end, { desc = 'Show Output (Neotest)' })
vim.keymap.set('n', '<leader>jO', function()
  require('neotest').output_panel.toggle()
end, { desc = 'Toggle Output Panel (Neotest)' })
vim.keymap.set('n', '<leader>jS', function()
  require('neotest').run.stop()
end, { desc = 'Stop (Neotest)' })
vim.keymap.set('n', '<leader>jw', function()
  require('neotest').run.run { jestCommand = 'yarn workspace backend jest --watch ' }
end, { desc = 'Toggle Watch (Neotest)' })
