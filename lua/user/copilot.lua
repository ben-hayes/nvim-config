local M = {}

M.suggestion = {
  enabled = true,
  auto_trigger = true,
  debounce = 25,
  keymap = {
    accept = "<C-s>",
    accept_word = "<C-d>",
    dismiss = "<C-a>",
    next = "<C-l>",
    prev = "<C-h>",
  }
}
M.filetypes = {
  yaml = true,
  lua = true,
}
M.panel = { enabled = true }
return M
