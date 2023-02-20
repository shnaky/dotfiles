-- import barbar safely
local setup, barbar = pcall(require, "bufferline")
if not setup then
	return
end

-- configure barbar
barbar.setup()
