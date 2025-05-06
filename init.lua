-- vim.lsp.set_log_level("debug")
vim.loader.enable()
--- global settings
require("user.options")
require("user.autocommands")

--- load plugins
require("user.keymaps")
require("lazy-nvim")

