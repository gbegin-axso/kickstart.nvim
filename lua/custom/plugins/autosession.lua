return {
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>ta', '<cmd>AutoSession search<CR>', desc = '[T]oggle [A]uto-session' },
    },
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      session_lens = {
        picker = nil,
        mappings = {
          delete_session = { 'i', '<C-d>' },
          alternate_session = { 'i', '<C-s>' },
          copy_session = { 'i', '<C-y>' },
        },
        load_on_setup = true,
      },
    },
  },
}
