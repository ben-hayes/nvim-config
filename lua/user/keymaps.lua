--[[ local status_ok, wk = pcall(require, "which-key") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
vim.o.timeout = true
vim.o.timeoutlen = 200

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vertically centre cursor on C-u and C-d
keymap("n", "<C-d>", "<C-d>zz", { remap = false })
keymap("n", "<C-u>", "<C-u>zz", { remap = false })

-- resize
keymap("", "<S-Down>", ":resize -2<CR>", { desc = "Decrease height", remap = false })
keymap("", "<S-Left>", ":vertical resize -2<CR>", { desc = "Decrease width", remap = false })
keymap("", "<S-Right>", ":vertical resize +2<CR>", { desc = "Increase width", remap = false })
keymap("", "<S-Up>", ":resize +2<CR>", { desc = "Increase height", remap = false })

-- THESE DON'T PLAY NICELY WITH WK FOR SOME REASON --
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==gv", opts)
keymap("v", "<S-k>", ":m .-2<CR>==gv", opts)
-- keymap("v", "p", '"_dp', opts)
keymap("v", "p", "P", opts)

keymap("n", "c", '"cc', opts)
keymap("v", "c", '"cc', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- -- Formatting
-- keymap("n", "<leader>F", vim.lsp.buf.format, { desc = "Format buffer", remap = false })

-- Tab management
keymap("n", "<leader>Q", "<cmd>tabonly<cr>", { desc = "Close all tabs except current" })
keymap("n", "<leader>T", "<cmd>tab split<cr>", { desc = "Open new tab with current buffer" })
keymap("n", "<leader>q", "<cmd>tabclose<cr>", { desc = "Close tab" })

vim.keymap.set("n", "H", "<cmd>tabprev<cr>")
vim.keymap.set("n", "L", "<cmd>tabnext<cr>")
keymap("n", "<leader>bd", "<cmd>%bd|e#|bd#|'\"<cr>", { desc = "Close all buffers except current" })

--- move up and down through word-wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", "yygccp", { remap = true })

-- change in word
vim.keymap.set("n", "<c-c>", "ciw")

-- wrap word with brackets and (start) writing text before
vim.keymap.set("n", "yss", "ysiw)[(i", { remap = true })

-- wrap selection with brackets and start writing text before
vim.keymap.set("v", "yss", "ys)[(i", { remap = true })
