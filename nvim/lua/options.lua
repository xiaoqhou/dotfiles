-- Make line numbers default
vim.o.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.listchars = "tab:» ,lead:•,trail:•,nbsp:␣"

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- tab and indent
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true --expend tab to spaces
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.linebreak = true

-- sync vim clipboard with os
--vim.o.clipboard = "unnamedplus"
vim.g.clipboard = "osc52"

-- WSL yank support, change the clip path according to your mount point
local clip = "/mnt/c/Windows/System32/clip.exe"
if vim.fn.executable(clip) == 1 then
  vim.api.nvim_create_augroup("WSLYank", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "WSLYank",
    callback = function()
      if vim.v.event.operator == "y" then
        vim.fn.system(clip, vim.fn.getreg('"'))
      end
    end,
  })
end

vim.o.winbar = "%=%m %f"
