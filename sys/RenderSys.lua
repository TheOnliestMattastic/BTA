-- =============================================================================
-- sys/RenderSys.lua
-- WHAT: System to draw onto the screen
-- -----------------------------------------------------------------------------

-- inherit from SystemsMaster
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
	local VIR = require("lib.virtual")
	local Button = require("components.Buttons")

	-- render text
	local textEntities = self.entityMaster:getEntitiesWith("Text")
	for _, id in ipairs(textEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local text = self.entityMaster:getComponent(id, "Text")

		if text then
			love.graphics.setNewFont(text.font)
		else
			love.graphics.setNewFont(self.ui.fontM)
		end
		love.graphics.print(text.text, transform.x * self.VIR.WIDTH, transform.y)
	end

	-- render buttons
	local buttonEntities = self.entityMaster:getEntitiesWith("Button")
	for _, id in ipairs(buttonEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local ui = self.entityMaster:getComponent(id, "Button")
		local elementKey = ui.element
		local elementData = self.ui[elementKey]

		if elementData then
      -- stylua: ignore
			Button.draw(
			  elementData,
			  transform.x + VIR.WIDTH,
			  transform.y * VIR.HEIGHT,
			  ui.w * VIR.WIDTH,
			  ui.h * VIR.HEIGHT
			)
		end
	end
end

function RenderSys:update(dt)
	local V = require("lib.virtual")
	V.scaleScreen()
end

return RenderSys
