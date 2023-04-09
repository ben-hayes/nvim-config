local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remove manpage functionality from K
keymap("", "K", "<Nop>", opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vertically centre cursor on C-u and C-d
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==gv", opts)
keymap("v", "<S-k>", ":m .-2<CR>==gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
  opts
)

keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

keymap(
  "n",
  "<leader>s",
  "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
  opts
)

keymap("n", "<leader>t", "<cmd>Telescope<cr>", opts)
keymap("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", opts)

keymap(
  "n",
  "<leader>b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({previewer = true}))<cr>", opts
)

keymap(
  "n",
  "<leader>,",
  "<cmd>lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown({previewer = true}))<cr>",
  opts
)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Formatting
keymap("n", "<leader>F", ":Format<cr>", opts)

-- Safe delete buffers
keymap("n", "<C-q>", ":Bd<cr>", opts)

-- Return to home screen (alpha)
keymap("n", "<leader>a", ":Alpha<cr>", opts)

-- open iron repl
keymap('n', '<leader>rs', '<cmd>IronRepl<cr>', opts)
keymap('n', '<leader>rr', '<cmd>IronRestart<cr>', opts)
keymap('n', '<leader>rf', '<cmd>IronFocus<cr>', opts)
keymap('n', '<leader>rh', '<cmd>IronHide<cr>', opts)

keymap('n', '<leader>c', 'o# %%\n', term_opts)
keymap('n', '<leader>C', '[h o# %%\n', term_opts)

-- run jupyter cell
keymap("n", "]x", "qtrih", term_opts)
keymap("n", "<leader>x", "qtrih", term_opts)
keymap("n", "<leader>X", "qtrih]h", term_opts)
keymap("n", "<leader>z", "qtrgg", term_opts)
keymap("n", "<leader>Z", "ggqtrG", term_opts)
