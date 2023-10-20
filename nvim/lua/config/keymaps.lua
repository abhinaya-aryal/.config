local opts = { silent = true }

-- INFO: Better window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- INFO: Resize with arrows
vim.keymap.set("n", "<c-up>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- INFO: Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- INFO: Better paste in visual mode
vim.keymap.set("v", "p", '"_dP', opts)

-- INFO: Copy whole file content to clipboard
vim.keymap.set("n", "<c-c>", ":%y+<CR>", opts)

-- INFO: Save Buffer
vim.keymap.set("n", "<leader>wb", "<cmd>update<cr>", { silent = true, desc = "Write Buffer" })

-- INFO: Enter Normal mode from insert mode terminal mode and visual mode
vim.keymap.set("i", "ij", "<ESC>", opts)
vim.keymap.set("v", "ij", "<ESC>", opts)
vim.keymap.set("t", "ij", [[<ESC><C-\><C-n>]], opts)

-- INFO: Indentation in visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- INFO: Move line up or down in all modes
vim.keymap.set("n", "<a-j>", ":m .+1<cr>", opts)
vim.keymap.set("n", "<a-k>", ":m .-2<CR>", opts)
vim.keymap.set("i", "<a-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<a-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("v", "<a-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<a-k>", ":m '<-2<CR>gv=gv", opts)
