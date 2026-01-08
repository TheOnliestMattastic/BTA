-- =============================================================================
-- ui/text.lua
-- -----------------------------------------------------------------------------

local UI = require("assets.config.uiData")
local virtual = require("lib.virtual")
local Text = {}

-- stylua: ignore start
Text.ALIGN = {
	LEFT     = "left",
	CENTER   = "center",
	RIGHT    = "right",
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
-- stylua: ignore end
}

function Text.drawTitle()
	local txt = "Battle Tactics Arena"
	local width = Text.FONT.XL:getWidth(txt)
	local x = (virtual.WIDTH / 2) - (width / 2)
	local y = virtual.HEIGHT / 3
	love.graphics.setFont(Text.FONT.XL)
	love.graphics.print(txt, x, y)
end

return Text
