-- Place this in your Neovim config

return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>td', '<cmd>DiffviewFileHistory<CR>', desc = '[D]iff tree' },
    },
    config = function()
      local function toggle_diffview()
        local views = require('diffview.lib').views
        if next(views) == nil then
          vim.cmd 'DiffviewOpen'
        else
          -- Move to the tab containing Diffview
          for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
              local buf = vim.api.nvim_win_get_buf(win)
              local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
              if ft == 'DiffviewFiles' or ft == 'DiffviewFileHistory' then
                vim.api.nvim_set_current_tabpage(tab)
                return
              end
            end
          end
        end
      end

      vim.keymap.set('n', '<leader>bb', toggle_diffview, { desc = 'Toggle Diffview' })
    end,
  },
}
