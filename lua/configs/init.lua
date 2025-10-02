require("configs.options")
require("configs.keymaps")
require("configs.lazy_init")
require("configs.swift")

vim.cmd.colorscheme("catppuccin")

vim.cmd([[
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
" highlight TelescopeNormal guibg=none
" highlight TelescopeBorder guibg=none
" highlight TelescopePromptNormal guibg=none
" highlight TelescopeResultsNormal guibg=none
" highlight TelescopePreviewNormal guibg=none
]])
