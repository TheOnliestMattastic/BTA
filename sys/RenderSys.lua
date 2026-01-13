-- =============================================================================
-- sys/RenderSys.lua
-- WHAT: Rendering system; draws entities (Text, Button) to screen via Love2D
-- WHY: Separates rendering logic from entity/component storage; centralizes draw calls
-- HOW: Inherits from SystemsMaster; queries entities by component type; uses virtual resolution
-- NOTE: drawState() renders Text and Button entities; update() calls virtual.scaleScreen()
-- =============================================================================

local SystemsMaster = require("core.SystemsMaster")
local RenderSys = setmetatable({}, { __index = SystemsMaster })
RenderSys.__index = RenderSys

function RenderSys.new(entityMaster, uiReg)
	local self = setmetatable(SystemsMaster.new(entityMaster), RenderSys)
	self.VIR = require("lib.virtual")
	self.ui = uiReg
	return self
end

function RenderSys:drawState()
	-- render text
	local textEntities = self.entityMaster:getEntitiesWith("Text")
	for _, id in ipairs(textEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local text = self.entityMaster:getComponent(id, "Text")

		local font
		if not text.font then
			font = love.graphics.newFont(self.ui.fontM.img, self.ui.fontM.size)
		else
			font = love.graphics.newFont(text.font.img, text.font.size)
		end

		-- get text width
		local textW = font:getWidth(text.text)
		if not text.xOffset then
			text.xOffset = 0
		end

		love.graphics.setFont(font)

    -- stylua: ignore
		love.graphics.print(
		  text.text,
		  self.VIR.WIDTH * transform.x - textW * text.xOffset,
		  self.VIR.HEIGHT * transform.y
		)
	end

	-- render buttons
	local buttonEntities = self.entityMaster:getEntitiesWith("Button")
	for _, id in ipairs(buttonEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local ui = self.entityMaster:getComponent(id, "Button")
		local elementKey = ui.element
		local elementData = self.ui[elementKey]
	end
end

function RenderSys:update(dt)
	local V = require("lib.virtual")
	V.scaleScreen()
end

return RenderSys
