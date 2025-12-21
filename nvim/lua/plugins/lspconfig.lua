return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 
        'mason-org/mason.nvim', 
        opts = {
          --          PATH = "prepend"
        } 
      },
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      })

      local opts = {noremap =true, silent=true}
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        opts.desc = "Available code action"
        vim.keymap.set({"n","v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "show doc for what is under cursor"
        vim.keymap.set("n","k", vim.lsp.buf.hover, opts)
      end

      require("lspconfig")["lua_ls"].setup({
        on_attach = on_attach
      })

      -- show lsp diagnostic info
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }
    end
  }
}
