local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
  print('🥤 Cokeline config fail')
  return
end

local get_hex = require('cokeline/utils').get_hex
local space = {text = " "}


cokeline.setup({
  default_hl = {
    fg = function(buffer)
      return
      buffer.is_focused
      and get_hex('Normal', 'fg')
      or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },

  components = {
    space,
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
  }
})
