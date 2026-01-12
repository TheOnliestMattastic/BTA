-- =============================================================================
-- ui/buttons.lua
-- -----------------------------------------------------------------------------

local Button = {}

function Button.new(btnData)
	return {
		img = btnData.img,
		frameW = btnData.frameW,
		frameH = btnData.frameH,
		frames = btnData.frames,
		state = 0,
	}
end

return Button
