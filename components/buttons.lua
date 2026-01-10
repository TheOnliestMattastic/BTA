-- =============================================================================
-- ui/buttons.lua
-- -----------------------------------------------------------------------------

local Button = {}

function Button.add(btnConfig)
	local img = love.graphics.newImage(btnConfig.img)
	local w = btnConfig.frameW
	local h = btnConfig.frameH
	local quads = {}
	for state = 0, 3 do
		quads[state] = love.graphics.newQuad(state * w, 0, w, h, img)
	end
	return {
		img = img,
		w = w,
		h = h,
		quads = quads,
		state = 0,
	}
end

-- renders button centered at X
function Button.draw(btn, x, y, w, h)
	love.graphics.draw(btn.img, btn.quads[btn.state], x - w / 2, y, 0, w / btn.w, h / btn.h)
end

return Button
