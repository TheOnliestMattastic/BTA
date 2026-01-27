-- =============================================================================
-- sys/RenderSys.lua
-- -----------------------------------------------------------------------------
-- WHAT: Renders all drawable entities (backgrounds, text, buttons) to canvas
-- WHY:  Centralizes rendering logic; separates drawing from game logic
-- HOW:  System queries entityMaster for entities with drawable components,
--       calculates screen positions using virtual resolution, draws to canvas
-- NOTE: Virtual resolution ensures consistent scaling across different screen sizes
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local RenderSys = setmetatable({}, { __index = SM })
RenderSys.__index = RenderSys

function RenderSys.new(entityMaster)
	local self = setmetatable(SM.new(entityMaster), RenderSys)
	self.VIR = require("lib.virtual")
	return self
end

function RenderSys:drawState(canvas)
	-- Set render target to canvas (all drawing goes here until reset)
	-- ---------------------------------------------------------------------------
	love.graphics.setCanvas(canvas)

	-- Clear canvas by drawing background color
	-- ---------------------------------------------------------------------------
	local bgEntities = self.entityMaster:getEntitiesWith("Background")
	for _, id in ipairs(bgEntities) do
		local bgColor = self.entityMaster:getComponent(id, "Background")
		love.graphics.clear(bgColor.r, bgColor.g, bgColor.b, bgColor.a)
	end

	-- Render button entities (scale sprite to virtual dimensions, apply offset)
	-- ---------------------------------------------------------------------------
	local btnEntities = self.entityMaster:getEntitiesWith("Button")
	for _, id in ipairs(btnEntities) do
		local sel = self.entityMaster:getComponent(id, "Selection")
		local coords = self.entityMaster:getComponent(id, "Coords")
		local btn = self.entityMaster:getComponent(id, "Button")

		local btnW = btn.width * self.VIR.WIDTH
		local btnH = btn.height * self.VIR.HEIGHT
		local btnX = (coords.x * self.VIR.WIDTH) - (btnW * btn.xOffset)
		local btnY = (coords.y * self.VIR.HEIGHT) - (btnH * btn.xOffset)
		local sx = btnW / btn.frameW
		local sy = btnH / btn.frameH

		-- render button by state
		local state = 0
		if btn.isDisabled then
			state = 2
		elseif btn.isPressed then
			state = 3
		elseif sel.isSelected then
			state = 1
		end
		love.graphics.draw(btn.btn, btn.quads[state], btnX, btnY, 0, sx, sy)
	end

	-- Render text entities (convert virtual coords to screen coords with alignment)
	-- ---------------------------------------------------------------------------
	local textEntities = self.entityMaster:getEntitiesWith("Text")
	for _, id in ipairs(textEntities) do
		local coords = self.entityMaster:getComponent(id, "Coords")
		local text = self.entityMaster:getComponent(id, "Text")
		local btn = self.entityMaster:getComponent(id, "Button")

		local font
		if btn and btn.isPressed then
			-- pressed offset
			font = love.graphics.newFont(text.font.img, text.font.size * 0.85)
		else
			font = love.graphics.newFont(text.font.img, text.font.size)
		end

		local textW = font:getWidth(text.text)
		local textH = font:getHeight()
		local textX = (coords.x * self.VIR.WIDTH) - (textW * text.xOffset)
		local textY = (coords.y * self.VIR.HEIGHT) - (textH / 2)

		love.graphics.setFont(font)
		love.graphics.print(text.text, textX, textY)
	end

	-- Reset canvas target and apply virtual resolution scaling to final output
	-- ---------------------------------------------------------------------------
	love.graphics.setCanvas()
	if self.VIR.scale and self.VIR.scale > 0 then
		love.graphics.draw(canvas, self.VIR.translateX, self.VIR.translateY, 0, self.VIR.scale, self.VIR.scale)
	end
end

function RenderSys:update(dt)
	self.VIR.scaleScreen()
end

return RenderSys
