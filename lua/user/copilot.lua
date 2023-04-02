local M = {}

M.suggestion = {
  enabled = true,
  auto_trigger = true,
  debounce = 25,
  keymap = {
    accept = "<C-s>",
    dismiss = "<C-d>",
    next = "<C-l>",
    prev = "<C-h>",
  }
}
M.panel = { enabled = true }

return M
