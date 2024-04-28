vim.keymap.set("i", "jk", "<Esc>", { desc = "exit insert mode from home row"})
vim.keymap.set("n", "<C-s>", "<cmd>update<cr>", { desc = "save file in normal mode when updated"})
vim.keymap.set("i", "<C-s>", "<C-o><cmd>update<cr>", { desc = "save file in insert mode when updated"})

vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<Cr>", { desc = "Lazy" })
vim.keymap.set("n", "<localleader>cr", "<cmd>!cargo run<Cr>", { desc = "cargo run"})
