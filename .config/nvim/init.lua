-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Ali: Don't fold by default
vim.opt.foldenable = false

-- Ali: Tab sizes
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- don't comment on new lines
vim.cmd 'autocmd BufEnter * set formatoptions-=cro'
vim.cmd 'autocmd BufEnter * setlocal formatoptions-=cro'

require 'custom.keymaps'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install and configure plugins with vim.pack ]]
--
--  To check the current status of your plugins, run
--    :lua vim.print(vim.pack.get())
--
--  To update plugins you can run
--    :lua vim.pack.update()
--
local gh = function(x) return 'https://github.com/' .. x end

-- Build hooks for plugins that need post-install/update steps
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind == 'install' or kind == 'update' then
      if name == 'nvim-treesitter' then
        vim.cmd('TSUpdate')
      end
      if name == 'telescope-fzf-native.nvim' then
        vim.system({ 'make' }, { cwd = ev.data.path })
      end
    end
  end,
})

vim.pack.add({
  -- Core
  gh('tpope/vim-sleuth'),
  gh('lewis6991/gitsigns.nvim'),
  gh('rebelot/kanagawa.nvim'),
  gh('f-person/auto-dark-mode.nvim'),
  gh('folke/todo-comments.nvim'),
  gh('nvim-lua/plenary.nvim'),

  -- LSP
  gh('folke/neoconf.nvim'),
  gh('folke/lazydev.nvim'),
  gh('neovim/nvim-lspconfig'),
  gh('Bilal2453/luvit-meta'),
  gh('mason-org/mason.nvim'),
  gh('mason-org/mason-lspconfig.nvim'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),

  -- Completion
  gh('zbirenbaum/copilot.lua'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
  gh('rafamadriz/friendly-snippets'),
  gh('fang2hou/blink-copilot'),

  -- Telescope
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-telescope/telescope-fzf-native.nvim'),
  gh('nvim-telescope/telescope-ui-select.nvim'),
  gh('nvim-tree/nvim-web-devicons'),

  -- Treesitter
  gh('nvim-treesitter/nvim-treesitter'),
  gh('Wansmer/treesj'),
  gh('nvim-treesitter/nvim-treesitter-context'),

  -- UI / Editor
  gh('folke/which-key.nvim'),
  gh('echasnovski/mini.nvim'),
  gh('stevearc/conform.nvim'),
  gh('nvim-neo-tree/neo-tree.nvim'),
  gh('MunifTanjim/nui.nvim'),
  gh('f-person/git-blame.nvim'),
  gh('olimorris/codecompanion.nvim'),
  gh('folke/sidekick.nvim'),
  gh('julienvincent/hunk.nvim'),
  gh('rafikdraoui/jj-diffconflicts'),
  gh('lukas-reineke/indent-blankline.nvim'),
  gh('mfussenegger/nvim-lint'),
  gh('windwp/nvim-autopairs'),
  gh('windwp/nvim-ts-autotag'),

  -- Custom plugins
  gh('kevinhwang91/nvim-ufo'),
  gh('kevinhwang91/promise-async'),
  gh('folke/noice.nvim'),
  gh('christoomey/vim-tmux-navigator'),
  gh('nvim-lualine/lualine.nvim'),
  gh('Bekaboo/dropbar.nvim'),
  gh('brenoprata10/nvim-highlight-colors'),
  gh('s1n7ax/nvim-window-picker'),
  gh('chrisgrieser/nvim-early-retirement'),
  gh('folke/flash.nvim'),
  { src = gh('ThePrimeagen/harpoon'), version = 'harpoon2' },
  gh('pwntester/octo.nvim'),
  gh('NickvanDyke/opencode.nvim'),
  gh('folke/snacks.nvim'),
  gh('nvim-neotest/neotest'),
  gh('nvim-neotest/nvim-nio'),
  gh('antoinemadec/FixCursorHold.nvim'),
  gh('nvim-neotest/neotest-jest'),
  gh('folke/trouble.nvim'),
})

-- [[ Load plugin configurations ]]
-- Order matters: colorscheme first, then foundational plugins, then the rest.
require('core.plugins')        -- colorscheme, gitsigns base, diagnostics, etc.
require('core.plugins.lsp')    -- mason + lspconfig (must come before cmp references)
require('core.plugins.cmp')
require('core.plugins.telescope')
require('core.plugins.treesitter')
require('core.plugins.which-key')
require('core.plugins.mini')
require('core.plugins.autoformat')
require('core.plugins.neo-tree')
require('core.plugins.git-blame')
require('core.plugins.code-companion')
require('core.plugins.sidekick')
require('core.plugins.jjui')

require('kickstart.plugins.indent_line')
require('kickstart.plugins.lint')
require('kickstart.plugins.autopairs')
require('kickstart.plugins.gitsigns')

require('custom.plugins')       -- ufo, noice, lualine, dropbar, etc.
require('custom.plugins.flash')
require('custom.plugins.harpoon')
require('custom.plugins.octo')
require('custom.plugins.opencode')
require('custom.plugins.test')
require('custom.plugins.trouble')

-- vim: ts=2 sts=2 sw=2 et
