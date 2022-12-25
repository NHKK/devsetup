require('mini.statusline').setup({})
require('mini.comment').setup({
  mappings = {
    comment = "gc"
  }
})
require('mini.jump2d').setup({
  mappings = {
    start_jumping = "S"
  }
})
require('mini.indentscope').setup({})
require('mini.pairs').setup({})
require('mini.tabline').setup({})
require('mini.base16').setup({

  -- Catppuccin Mocha
  -- palette = {
  -- 	base00 = "#1e1e2e",
  -- 	base01 = "#181825",
  -- 	base02 = "#313244",
  -- 	base03 = "#45475a",
  -- 	base04 = "#585b70",
  -- 	base05 = "#cdd6f4",
  -- 	base06 = "#f5e0dc",
  -- 	base07 = "#b4befe",
  -- 	base08 = "#f38ba8",
  -- 	base09 = "#fab387",
  -- 	base0A = "#f9e2af",
  -- 	base0B = "#a6e3a1",
  -- 	base0C = "#94e2d5",
  -- 	base0D = "#89b4fa",
  -- 	base0E = "#cba6f7",
  -- 	base0F = "#f2cdcd"
  -- },

  -- Embark Custom
  palette = {
    base00 = '#100E23',
    base01 = '#1E1C31',
    base02 = '#2D2B40',
    base03 = '#3E3859',
    base04 = '#8A889D',
    base05 = '#CBE3E7',
    base06 = '#CBE3E7',
    base07 = '#f3f4f5',
    base08 = '#F02E6E',
    base09 = '#F2B482',
    base0A = '#FFE6B3',
    base0B = '#62D196',
    base0C = '#91DDFF',
    base0D = '#65B2FF',
    base0E = '#D4BFFF',
    base0F = '#87DFEB'
  },

  -- DUO Tone Dark
  -- palette = {
  -- 	base00 = "#2a2734",
  -- 	base01 = "#363442",
  -- 	base02 = "#5a566c",
  -- 	base03 = "#726e87",
  -- 	base04 = "#837bad",
  -- 	base05 = "#9b87fd",
  -- 	base06 = "#b3a5fe",
  -- 	base07 = "#eeebff",
  -- 	base08 = "#7765d2",
  -- 	base09 = "#dc9147",
  -- 	base0A = "#e59e57",
  -- 	base0B = "#7c756e",
  -- 	base0C = "#fec286",
  -- 	base0D = "#ecab69",
  -- 	base0E = "#a49bcf",
  -- 	base0F = "#8e81cf"
  -- },

  use_cterm = true,
})
