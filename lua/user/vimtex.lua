vim.g.vimtex_view_method = "sioyek"

-- Disable vimtex syntax highlighting
-- This is a shame as the highlighting is quite good, but it's just too slow using the
-- legacy vim syntax engine. So best to fall back on treesitter.
vim.g.vimtex_syntax_enabled = 0

local function setTextSettings()
	vim.opt.wrap = true
  vim.opt.linebreak = true

  -- set spell checker
  vim.opt.spell = true
  vim.opt.spelllang = "en_gb"
end

vim.api.nvim_create_autocmd("FileType", { pattern = { "tex", "markdown" }, callback = setTextSettings })
