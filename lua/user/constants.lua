local Constants = {}

Constants = {

-- ------------------------------------------------------------------------- }}}
-- {{{ Language Server Protocol (LSP) Names.

lsp_to_mason = {
	{ lsp = 'lua_ls',   mason = 'lua-language-server' },
},

-- ------------------------------------------------------------------------- }}}
-- {{{ LSP kind icons.

lsp_kind_icons = {
  Class         = '',
  Color         = '',
  Constant      = '',
  Constructor   = '',
  Enum          = '',
  EnumMember    = '',
  Event         = '',
  Field         = '',
  File          = '',
  Folder        = '',
  Function      = '',
  Interface     = '',
  Keyword       = '',
  Method        = '',
  Module        = '',
  Operator      = '',
  Property      = '',
  Reference     = '',
  Snippet       = ' ',
  Struct        = '',
  Text          = '',
  TypeParameter = '',
  Unit          = '',
  Value         = '',
  Variable      = '',
  buffer        = '﬘ ',
  calc          = ' ',
  nvim_lsp      = ' ',
  path          = ' ',
  spell         = ' ',
  vsnip         = ' ',
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Diagnostics Signs.

diagnostic_signs = {
   Error = '',
   Hint  = '',
   Info  = '',
   Warn  = '',
},

git_signs = {
  added = ' ',
  modified = ' ',
  removed = ' ',
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Display boarders

display_border = {border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}},

-- ------------------------------------------------------------------------- }}}
-- {{{ keybinding options

normal_opts = {
  mode    = 'n',        -- NORMAL mode
  prefix  = '<leader>', -- Override this value.
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer
                        --   local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
},

visual_opts = {
  mode    = 'v',        -- VISUAL mode
  prefix  = '<leader>', -- Override this value.
  buffer  = nil,        -- Global mappings. Specify a buffer number for buffer
                        -- local mappings
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Completion source mapping

source_mapping = {
  spell         = '[Spell]',
  luasnip       = '[Snippet]',
  nvim_lsp      = '[LSP]',
  buffer        = '[Buffer]',
  latex_symbols = '[LaTeX]',
  nvim_lua      = '[Lua]',
  path          = '[Path]',
},

sources = {
  { name = 'luasnip',       keyword_length = 1, max_item_count = 30 },
  { name = 'spell',         keyword_length = 2, max_item_count = 30 },
  { name = 'buffer',        keyword_length = 2, max_item_count = 30 },
  { name = 'nvim_lsp',      keyword_length = 2, max_item_count = 30 },
  { name = 'calc',          keyword_length = 2, max_item_count = 30 },
  { name = 'latex_symbols', keyword_length = 1, max_item_count = 30 },
  { name = 'nvim_lua',      keyword_length = 1, max_item_count = 30 },
  { name = 'path',          keyword_length = 3, max_item_count = 30 },
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Treesitter

treesitter_languages = {
  'dockerfile',
  'help',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'regex',
  'sql',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'yaml',
},

-- ------------------------------------------------------------------------- }}}
-- {{{ Return Constants table.
}

return Constants

-- ------------------------------------------------------------------------- }}}
