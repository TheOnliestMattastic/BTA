-- =============================================================================
-- ui/text.lua
-- -----------------------------------------------------------------------------
-- WHAT: Text rendering UI component with font sizes and alignment support
-- WHY: Abstracts Love2D font/print calls; provides consistent text styling
-- HOW: Loads fonts from uiData; Text.add() renders with alignment calculations
-- TODO: Refactor to read font config dynamically; add color/shadow support
-- -----------------------------------------------------------------------------

local UI = require("registries.uiReg")
local Text = {}

-- stylua: ignore start
Text.ALIGN = {
	LEFT     = nil, -- don't modify x
	CENTER   = 2, -- divide txtWidth by 2
	RIGHT    = 1, -- divide txtWidth by 1
}

Text.FONT  = {
	XXS      = love.graphics.newFont(UI.fontXXS.img, UI.fontXXS.size),
	XS       = love.graphics.newFont(UI.fontXS.img, UI.fontXS.size),
	S        = love.graphics.newFont(UI.fontS.img, UI.fontS.size),
	M        = love.graphics.newFont(UI.fontM.img, UI.fontM.size),
	L        = love.graphics.newFont(UI.fontL.img, UI.fontL.size),
	XL       = love.graphics.newFont(UI.fontXL.img, UI.fontXL.size),

	XXS_ALT  = love.graphics.newFont(UI.fontXXS_alt.img, UI.fontXXS_alt.size),
	XS_ALT   = love.graphics.newFont(UI.fontXS_alt.img, UI.fontXS_alt.size),
	S_ALT    = love.graphics.newFont(UI.fontS_alt.img, UI.fontS_alt.size),
	M_ALT    = love.graphics.newFont(UI.fontM_alt.img, UI.fontM_alt.size),
	L_ALT    = love.graphics.newFont(UI.fontL_alt.img, UI.fontL_alt.size),
	XL_ALT   = love.graphics.newFont(UI.fontXL_alt.img, UI.fontXL_alt.size),
}
-- stylua: ignore end

function Text.add(string, x, y, font, align)
	local txt = string
	local txtFont = font or Text.FONT.M
	local txtX = x

	if align then -- blank or ALIGN.LEFT
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
