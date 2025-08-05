return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,
      theme = "gruvbox",
    },
    sections = {
      lualine_c = {{"filename", path = 3 }}     -- filename with absolute path
    },
    winbar = {
      lualine_x = {
        '%=', '%m %f',
        {
          function()
            return '(' .. vim.fn.len(
              vim.fn.filter(
                vim.fn.range(1, vim.fn.bufnr('$')),
                'buflisted(v:val)'
              )
            ) .. ')'
          end,
          icon = '📄',
          color = { fg = '#88C0D0' }
        }
      }
    } --winbar
  } --opts
}
