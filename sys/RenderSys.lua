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

function RenderSys.new(entityMaster)
	local self = setmetatable(SystemsMaster.new(entityMaster), RenderSys)
	self.VIR = require("lib.virtual")
	return self
end

function RenderSys:drawMenuState()
	-- render background
	local bgEntities = self.entityMaster:getEntitiesWith("Background")
  -- print(bgEntities)
	for _, id in ipairs(bgEntities) do
    print(id)
		local bgColor = self.entityMaster:getComponent(id, "Background")
		love.graphics.clear(bgColor.r, bgColor.g, bgColor.b, bgColor.a)
		print(bgColor)
	end

	-- render text
	local textEntities = self.entityMaster:getEntitiesWith("Text")
	for _, id in ipairs(textEntities) do
		local transform = self.entityMaster:getComponent(id, "Position")
		local text = self.entityMaster:getComponent(id, "Text")

		local font = love.graphics.newFont(text.font.img, text.font.size)

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
end

function RenderSys:update(dt)
	local V = require("lib.virtual")
	V.scaleScreen()
end

return RenderSys
