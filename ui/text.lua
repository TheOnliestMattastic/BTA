-- =============================================================================
-- ui/text.lua
-- -----------------------------------------------------------------------------

local UI = require("assets.config.uiData")
local Text = {}
Text.__index = Text

Text.ALIGN = {
	LEFT = "left",
	CENTER = "center",
	RIGHT = "right",
}

function Text.new(string, x, y, font, align)
	local self = setmetatable({}, Text)
	self.string = string
	self.x = x
	self.y = y
	if font then
		self.font = love.graphics.newFont(font.img, font.size)
	else
		self.font = love.graphics.newFont(UI.fontMed.img, UI.fontMed.size)
	end
	self.align = align or Text.ALIGN.CENTER
end

-- draw
-- -----------------------------------------------------------------------------

function Text:draw()
	love.graphics.setFont(self.font)
	love.graphics.print(self.string, self.x, self.y)
end

return Text
