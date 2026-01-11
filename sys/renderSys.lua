-- =============================================================================
-- sys/renderSys.lua
-- WHAT: System to draw onto the screen
-- -----------------------------------------------------------------------------

-- inherit from masterClass
local MC = require("core.MasterClass")
local renderSys = setmetatable({}, { __index = MC })
renderSys.__index = renderSys

local G = require("lib.globals")
local Text = require("components.text")
local Button = require("components.buttons")

function renderSys.new(entityMaster)
	local self = setmetatable(MC.new(entityMaster), renderSys)
	G.virtual.scaleScreen()
	return self
end

function renderSys:drawMenuUI()
	-- render text
	local textEntities = self.entityMaster:getEntitiesWith("TextRender")
	for _, id in ipairs(textEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local text = self.entityMaster:getComponent(id, "TextRender")
		Text.add(text.text, transform.x * G.virtual.WIDTH, transform.y * G.virtual.HEIGHT, text.font, text.align)
	end

	-- render buttons
	local buttonEntities = self.entityMaster:getEntitiesWith("UIRender")
	for _, id in ipairs(buttonEntities) do
		local transform = self.entityMaster:getComponent(id, "Transform")
		local ui = self.entityMaster:getComponent(id, "UIRender")
		local elementKey = ui.asset
		local elementData = G.ui[elementKey]

		if elementData then
			Button.draw(
				elementData,
				transform.x + G.virtual.WIDTH,
				transform.y * G.virtual.HEIGHT,
				ui.w * G.virtual.WIDTH,
				ui.h * G.virtual.HEIGHT
			)
		end
	end
end

function renderSys:update(dt)
	G.virtual.scaleScreen()
end

return renderSys
