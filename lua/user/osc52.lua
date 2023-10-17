local status_ok, osc52 = pcall(require, "osc52")
if not status_ok then
  return
end

osc52.setup {
  tmux_passthrough = true,
}
