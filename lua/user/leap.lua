local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end
local status_ok, flit = pcall(require, "flit")
if not status_ok then
	return
end

leap.add_default_mappings()
flit.setup {}
