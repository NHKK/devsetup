local jump = require "mini.jump2d"
jump.setup({
  mappings = {
    start_jumping = "S"
  },
})

local indent = require "mini.indentscope"
indent.setup({})

local autopair = require "mini.pairs";
autopair.setup({})

local comment = require "mini.comment";
comment.setup({
  mappings = {
    comment = "gc",
  },
})

--require('mini.base16').setup({
--  palette = {
--    -- Default Background
--    base00 = "#2d2b40",
--    -- Lighter Background (Used for status bars, line number and folding marks)
--    base01 = "#3e3859",
--    -- Selection Background
--    base02 = "#423f46",
--    -- Comments, Invisible, Line Highlighting
--    base03 = "#8A889D",
--    -- Dark Foreground (Used for status bars)
--    base04 = "#91ddff",
--    -- Default Foreground, Caret, Delimiters, Operators
--    base05 = "#cbe3e7",
--    -- Light Foreground (Not often used)
--    base06 = "#a1efe4",
--    -- Light Background (Not often used)
--    base07 = "#f8f8f2",
--    -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
--    base08 = "#f48fb1",
--    -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
--    base09 = "#f2b482",
--    -- Classes, Markup Bold, Search Text Background
--    base0A = "#a1efd3",
--    -- Strings, Inherited Class, Markup Code, Diff Inserted
--    base0B = "#ffe6b3",
--    -- Support, Regular Expressions, Escape Characters, Markup Quotes
--    base0C = "#91ddff",
--    -- Functions, Methods, Attribute IDs, Headings
--    base0D = "#9ecd6f",
--    -- Keywords, Storage, Selector, Markup Italic, Diff Changed
--    base0E = "#87dfeb",
--    -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
--    base0F = "#f9f8f5",
--  },
--  use_cterm = true,
--})
--
--function diagnostics_table(args)
--  local info = vim.b.coc_diagnostic_info
--  if MiniStatusline.is_truncated(args.trunc_width) or info == nil then
--    return {}
--  end
--  local table = {}
--  table.e = (info['error'] or 0) > 0 and 'E'..info['error'] or ''
--  table.w = (info['warning'] or 0) > 0 and 'W'..info['warning'] or ''
--  table.h = (info['hint'] or 0) > 0 and 'H'..info['hint'] or ''
--  table.i = (info['information'] or 0) > 0 and 'I'..info['information'] or ''
--  table.s = vim.g.coc_status
--  return table
--end
--
--function status_config()
--  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
--  local git           = MiniStatusline.section_git({ trunc_width = 75 })
--  local diagnostics   = diagnostics_table({ trunc_width = 75 })
--  local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
--  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
--  local location      = MiniStatusline.section_location({ trunc_width = 75 })
--
--  return MiniStatusline.combine_groups({
--  { hl = mode_hl,                  strings = { mode } },
--  { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics['s'] } },
--  { hl = 'MiniStatuslineError',  strings = { diagnostics['e'] } },
--  { hl = 'MiniStatuslineWarning',  strings = { diagnostics['w'] } },
--  { hl = 'MiniStatuslineInfo',  strings = { diagnostics['i'] } },
--  { hl = 'MiniStatuslineHint',  strings = { diagnostics['h'] } },
--  '%<', -- Mark general truncate point
--  { hl = 'MiniStatuslineFilename', strings = { filename } },
--  '%=', -- End left alignment
--  { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
--  { hl = mode_hl,                  strings = { location } },
--  })
--end


-- local cmp = require "mini.completion";
-- cmp.setup()

local tab = require "mini.tabline"
tab.setup()
