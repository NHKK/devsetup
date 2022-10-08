local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🐞', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })


vim.keymap.set('n', '<F12>', function() require "dap".step_out() end)
vim.keymap.set('n', "<F11>", function() require "dap".step_into() end)
vim.keymap.set('n', '<F10>', function() require "dap".step_over() end)
vim.keymap.set('n', '<F5>', function() require "dap".continue() end)
vim.keymap.set('n', '<F4>', function() require "dap".terminate() end)
vim.keymap.set('n', '<A-B>', function() dap.clear_breakpoints() end)
vim.keymap.set('n', '<A-b>', function() require "dap".toggle_breakpoint() end)

--vim.keymap.set('n', '<leader>b', function() require "dap".toggle_breakpoint() end)
vim.keymap.set('n', '<A-h>', function() require "user.dap.helper".attach() end)


--require "user.dap.vscode"
require "user.dap.node"
