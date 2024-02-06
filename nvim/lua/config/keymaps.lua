local opts = { silent = true }

-- Better window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<c-up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<c-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<c-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<c-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Better paste in visual mode
vim.keymap.set("v", "p", '"_dP', opts)

-- Copy whole file content to clipboard
vim.keymap.set("n", "<c-c>", ":%y+<CR>", opts)

-- Enter Normal mode from insert mode terminal mode and visual mode
vim.keymap.set("i", "ij", "<ESC>", opts)
vim.keymap.set("v", "ij", "<ESC>", opts)
vim.keymap.set("t", "ij", [[<ESC><C-\><C-n>]], opts)

-- Indentation in visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move line up or down in all modes
vim.keymap.set("n", "<a-j>", ":m .+1<cr>", opts)
vim.keymap.set("n", "<a-k>", ":m .-2<CR>", opts)
vim.keymap.set("i", "<a-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<a-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("v", "<a-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<a-k>", ":m '<-2<CR>gv=gv", opts)

-- Esc to clear all the highlights of search
vim.keymap.set("n", "<ESC>", ":noh<cr>", opts)
