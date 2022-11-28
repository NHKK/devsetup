-- require("mason").setup()
-- require("mason-nvim-dap").setup({automatic_setup = true})
local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.configurations.javascript = {
  {
    type = "node2",
    name = "node attach",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
  }
}
dap.configurations.typescript = dap.configurations.javascript

dap.adapters.node2 = {
  type = "executable",
  command = "node-debug2-adapter",
  args = {}
}

-- dap.defaults.fallback.terminal_win_cmd = '20split new'

vim.fn.sign_define('DapBreakpoint', {text = '🛑', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '🟦', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '🍡', texthl = '', linehl = '', numhl = ''})

vim.keymap.set('n', '<leader>db', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dd', function() require("dapui").toggle() end)
vim.keymap.set('n', '<F5>', function() require"dap".continue() end)
vim.keymap.set('n', '<F6>', function() require"dap".step_over() end)
vim.keymap.set('n', "<F7>", function() require"dap".step_into() end)
vim.keymap.set('n', '<F8>', function() require"dap".step_out() end)

vim.keymap.set('n', '<leader>da', function()
  print("attaching")
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  })
end)

vim.keymap.set('n', '<leader>dA', function()
  print("attachingRemote")
  dap.run({
    type = 'node2',
    request = 'attach',
    address = "127.0.0.1",
    port = 9229,
    localRoot = vim.fn.getcwd(),
    remoteRoot = "/home/vcap/app",
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  })
end)

require('nvim-dap-virtual-text').setup()
