return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
    },
    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        keys = {},
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
    end,
    keys = {
      { '<leader>j', '', desc = '+test' },
      {
        '<leader>jt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File (Neotest)',
      },
      {
        '<leader>jT',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = 'Run All Test Files (Neotest)',
      },
      {
        '<leader>jr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest (Neotest)',
      },
      {
        '<leader>jl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last (Neotest)',
      },
      {
        '<leader>js',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary (Neotest)',
      },
      {
        '<leader>jo',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output (Neotest)',
      },
      {
        '<leader>jO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel (Neotest)',
      },
      {
        '<leader>jS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop (Neotest)',
      },
      {
        '<leader>jw',
        function()
          require('neotest').run.run { jestCommand = 'yarn workspace backend jest --watch ' }
        end,
        desc = 'Toggle Watch (Neotest)',
      },
    },
  },
}
