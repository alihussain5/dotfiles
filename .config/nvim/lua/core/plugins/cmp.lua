-- Copilot
require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
}

-- Blink completion
---@module 'blink.cmp'
---@type blink.cmp.Config
require('blink.cmp').setup {
  keymap = {
    preset = 'default',
    ['<Tab>'] = {
      'snippet_forward',
      function() -- sidekick next edit suggestion
        return require('sidekick').nes_jump_or_apply()
      end,
      'fallback',
    },
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = { documentation = { auto_show = true } },

  sources = {
    default = {
      'copilot',
      'lsp',
      'path',
      'snippets',
      'buffer',
    },
    providers = {
      copilot = {
        name = 'copilot',
        module = 'blink-copilot',
        score_offset = 100,
        async = true,
      },
      lsp = {
        transform_items = function(_, items)
          local neoconf = require 'neoconf'
          local exclude_patterns = neoconf.get 'completion.exclude_patterns' or {}

          return vim.tbl_filter(function(item)
            for _, pattern in ipairs(exclude_patterns) do
              if item.labelDetails and item.labelDetails.description then
                if item.labelDetails.description:match(pattern) then
                  return false
                end
              end
              if item.detail and item.detail:match(pattern) then
                return false
              end
            end
            return true
          end, items)
        end,
      },
    },
  },

  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
}
