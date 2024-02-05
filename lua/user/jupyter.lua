-- jupytext
-- vim.g.jupytext_fmt = "py"

-- iron
local status_ok, iron = pcall(require, "iron.core")
if not status_ok then
  return
end
local view = require("iron.view")

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
    repl_open_cmd = "vertical botright 80 split"
  },
  keymaps = {
    send_motion = "qtr",
    visual_send = "qtr"
  },
}
