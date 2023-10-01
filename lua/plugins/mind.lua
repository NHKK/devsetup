return {
  'phaazon/mind.nvim',
  dependencies = {
    {
      'nvim-lua/plenary.nvim'
    }
  },
  config = function()
    require('mind').setup()
  end,
  keys ={
    {
      "<leader>mn", "<cmd>:MindOpenProject<CR>", {"n"}, desc = "Mind Open Project"
    }
  }
}
