-- =============================================================================
-- lib/virtual.lua
-- -----------------------------------------------------------------------------
-- WHAT: Virtual resolution scaling and canvas translation
-- WHY: Support arbitrary window sizes while maintaining aspect ratio
-- HOW: Calculate scale factor and center offset based on virtual dimensions
-- -----------------------------------------------------------------------------

local virtual = {}

virtual.WIDTH = 1024
virtual.HEIGHT = 768

function virtual.scaleScreen()
	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()

	if w <= 0 or h <= 0 then
		virtual.scale = 0
		virtual.translateX = 0
		virtual.translateY = 0
		return
	end

	virtual.scale = math.min(w / virtual.WIDTH, h / virtual.HEIGHT)
	virtual.translateX = (w - virtual.WIDTH * virtual.scale) / 2
	virtual.translateY = (h - virtual.HEIGHT * virtual.scale) / 2
end

return virtual

