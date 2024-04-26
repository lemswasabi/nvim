vim.g.mapleader = " "

vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.spelllang = { "en" }
vim.opt.termguicolors = true

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
