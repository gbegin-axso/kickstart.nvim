return {
  { 'github/copilot.vim' },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    keys = {
      -- Normal mode mappings
      { '<Leader>zc', '<cmd>CopilotChat<CR>', mode = 'n', desc = 'Chat with Copilot' },
      { '<Leader>zm', '<cmd>CopilotChatCommit<CR>', mode = 'n', desc = 'Generate Commit Message' },

      -- Visual mode mappings
      { '<Leader>ze', '<cmd>CopilotChatExplain<CR>', mode = 'v', desc = 'Explain Code' },
      { '<Leader>zr', '<cmd>CopilotChatReview<CR>', mode = 'v', desc = 'Review Code' },
      { '<Leader>zf', '<cmd>CopilotChatFix<CR>', mode = 'v', desc = 'Fix Code Issues' },
      { '<Leader>zo', '<cmd>CopilotChatOptimize<CR>', mode = 'v', desc = 'Optimize Code' },
      { '<Leader>zd', '<cmd>CopilotChatDocs<CR>', mode = 'v', desc = 'Generate Docs' },
      { '<Leader>zt', '<cmd>CopilotChatTests<CR>', mode = 'v', desc = 'Generate Tests' },
      { '<Leader>zs', '<cmd>CopilotChatCommit<CR>', mode = 'v', desc = 'Generate Commit for Selection' },
    },
    build = 'make tiktoken',
  },
}
