vim.keymap.set("i", "jk", "<Esc>", { desc = "exit insert mode from home row"})
vim.keymap.set("n", "<C-s>", "<cmd>update<cr>", { desc = "save file in normal mode when updated"})
vim.keymap.set("i", "<C-s>", "<C-o><cmd>update<cr>", { desc = "save file in insert mode when updated"})

vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<Cr>", { desc = "Lazy" })
-- vim.keymap.set("n", "<localleader>cr", "<cmd>!cargo run<Cr>", { desc = "cargo run"})
vim.keymap.set("n", "<F4>", "<cmd>w<Cr><cmd>!cargo run<Cr>", { desc = "cargo run"})
vim.keymap.set("i", "<F4>", "<Esc><cmd>w<Cr><cmd>!cargo run<Cr>", { desc = "cargo run"})

vim.keymap.set(
  "n",
  "<leader>tn",
  function()
    vim.cmd("ObsidianWorkspace team_meeting_notes")
    vim.cmd("ObsidianNew")
    vim.cmd("ObsidianTemplate team_meeting_notes")
  end,
  { desc = "keymap for a new team meeting note" }
)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
