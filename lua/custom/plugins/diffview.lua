-- Place this in your Neovim config
local function getMainBrach()
  local root_dir = require('raven.utils').get_root()
  -- Use % for special characters ^$()%.[]*+-?) ex: https://www.lua.org/manual/5.1/manual.html#pdf-string.format
  if string.find(root_dir, 'projet-old') then
    return 'master'
  end
  return 'main'
end

local function getDevBrach()
  local root_dir = require('raven.utils').get_root()
  -- Use % for special characters ^$()%.[]*+-?) ex: https://www.lua.org/manual/5.1/manual.html#pdf-string.format
  if string.find(root_dir, 'projet-old') then
    return 'dev'
  end
  return 'develop'
end
return {
  {
    'sindrets/diffview.nvim',
    opts = {
      default_args = {
        DiffviewOpen = { '--imply-local' },
        DiffviewFileHistory = { '--imply-local' },
      },
    },
    keys = {
      { '<leader>gb', desc = '+Branche changes' },
      { '<leader>gc', desc = '+Branche commits' },
      {
        '<leader>gbm',
        '<cmd>DiffviewOpen origin/' .. getMainBrach() .. '...HEAD --imply-local<cr>',
        desc = 'DiffView Branche changes (main)',
      },
      {
        '<leader>gbd',
        '<cmd>DiffviewOpen origin/' .. getDevBrach() .. '...HEAD --imply-local<cr>',
        desc = 'DiffView Branche changes (dev)',
      },
      {
        '<leader>gcm',
        '<cmd>:DiffviewFileHistory --range=origin/' .. getMainBrach() .. '...HEAD --right-only --no-merges<cr>',
        desc = 'DiffView Branche commits (main)',
      },
      {
        '<leader>gcd',
        '<cmd>:DiffviewFileHistory --range=origin/' .. getDevBrach() .. '...HEAD --right-only --no-merges<cr>',
        desc = 'DiffView Branche commits (dev)',
      },
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView Current changes' },
      { '<leader>g%', '<cmd>DiffviewFileHistory %<cr>', desc = 'DiffView File History' },
    },
  },
}
