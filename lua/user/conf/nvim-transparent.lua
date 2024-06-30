-- require("transparent").setup({
-- enable = true, -- boolean: enable transparent
-- extra_groups = { -- table/string: additional groups that should be cleared
--     -- In particular, when you set it to 'all', that means all available groups

--     'NvimTreeNormal',
--     'NvimTreeStatuslineNc',
--     -- example of akinsho/nvim-bufferline.lua
--     -- "BufferLineTabClose",
--     -- "BufferlineBufferSelected",
--     -- "BufferLineFill",
--     -- "BufferLineBackground",
--     -- "BufferLineSeparator",
--     -- "BufferLineIndicatorSelected",
-- },
-- exclude = {}, -- table: groups you don't want to clear
-- })

require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",     -- plugins which have float panel such as Lazy, Mason, LspInfo
    "NvimTreeNormal"   -- NvimTree
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})

