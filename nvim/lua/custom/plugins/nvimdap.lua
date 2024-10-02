return {
  'mfussenegger/nvim-dap',
  dependancies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require 'dap'
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end,
}
