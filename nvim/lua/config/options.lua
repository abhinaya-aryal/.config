vim.g.mapleader = " " -- space key as leader key
vim.g.maplocalleader = " " -- space key as local leader too
-- vim.g.loaded_netrw = 1 --disable default file explorer
-- vim.g.loaded_netrwPlugin = 1

vim.opt.autowrite = true -- Enable auto write
vim.opt.backup = false -- don't create a backup file
vim.opt.autochdir = true -- nvim will change the current working directory whenever you open a file
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
-- vim.opt.cmdheight = 0
vim.opt.completeopt = { "longest", "menuone", "preview" } -- autocomplete menu format
vim.opt.conceallevel = 1 -- Hide * markup for bold and italic
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " " } --show empty lines at the end of a buffer as space default ~
vim.opt.formatoptions = "jcroqlnt" -- serially perform different task during formatting
vim.opt.grepformat = "%f:%l:%c:%m" -- format to recognize for the ":grep" command output
vim.opt.grepprg = "rg --vimgrep" -- program to use for the ":grep" command.
-- vim.opt.ignorecase = true -- ignore the case when searching
-- vim.opt.iskeyword:append("-") -- treats word with - as single
vim.opt.mouse = "" -- enable mouse mode "a" for all modes "nv"
vim.opt.number = true -- print the line number in front of each line
vim.opt.pumblend = 15 -- popup blend
vim.opt.pumheight = 15 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 999 -- Lines of context
vim.opt.shiftwidth = 2 -- size of an indent
vim.opt.shiftround = true -- better indentation support
-- vim.opt.shortmess:append({ c = true }) -- to autoconfirm short messages related to files
vim.opt.showmode = false -- Don't show mode since we have a statusline
vim.opt.signcolumn = "yes" -- always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartindent = true -- insert indents automatically
vim.opt.smartcase = true -- override ignorecase if search pattern contain uppercase characters
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- allow to put new windows below of the current
vim.opt.splitright = true -- allow to put new windows right of current
vim.opt.swapfile = false
vim.opt.tabstop = 2 -- number of spaces tabs count for
vim.opt.termguicolors = true -- true color support
vim.opt.undofile = true
vim.opt.updatetime = 100 -- used for the cursorhold autocommand event
vim.opt.wildmode = "longest:full"

-- NOTE: Vertically center document when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	command = "norm zz",
})

-- NOTE: required by markdown-preview.nvim
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 1
