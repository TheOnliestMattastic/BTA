-- =============================================================================
-- ui/text.lua
-- -----------------------------------------------------------------------------
-- WHAT: UI component for handling text for screen rendering
-- TODO: Refactor to read and configure data dynamically and handle input
-- -----------------------------------------------------------------------------

local UI = require("assets.config.uiData")
local Text = {}

-- stylua: ignore start
Text.ALIGN = {
	LEFT     = nil,
	CENTER   = 2,
	RIGHT    = 1,
}

Text.FONT = {
	XXS     = love.graphics.newFont(UI.fontXXS.img, UI.fontXXS.size),
	XS      = love.graphics.newFont(UI.fontXS.img, UI.fontXS.size),
	S       = love.graphics.newFont(UI.fontS.img, UI.fontS.size),
	M       = love.graphics.newFont(UI.fontM.img, UI.fontM.size),
	L       = love.graphics.newFont(UI.fontL.img, UI.fontL.size),
	XL      = love.graphics.newFont(UI.fontXL.img, UI.fontXL.size),

	XXS_ALT = love.graphics.newFont(UI.fontXXS_alt.img, UI.fontXXS_alt.size),
	XS_ALT  = love.graphics.newFont(UI.fontXS_alt.img, UI.fontXS_alt.size),
	S_ALT   = love.graphics.newFont(UI.fontS_alt.img, UI.fontS_alt.size),
	M_ALT   = love.graphics.newFont(UI.fontM_alt.img, UI.fontM_alt.size),
	L_ALT   = love.graphics.newFont(UI.fontL_alt.img, UI.fontL_alt.size),
	XL_ALT  = love.graphics.newFont(UI.fontXL_alt.img, UI.fontXL_alt.size),
}
-- stylua: ignore end

function Text.add(string, x, y, font, align)
	local txt = string or "Battle Tactics Arena"
	local txtFont = font or Text.FONT.L
	local txtX = x

	if align then
		local txtWidth = txtFont:getWidth(txt)
		if align == Text.ALIGN.CENTER then
			txtX = x - txtWidth / Text.ALIGN.CENTER
		else
			txtX = x - txtWidth / Text.ALIGN.RIGHT
		end
	end

	love.graphics.setFont(txtFont)
	love.graphics.print(txt, txtX, y)
end

return Text
