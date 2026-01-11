-- =============================================================================
-- core/EntityFactory.lua
-- WHAT: Factory for creating entities from config templates
-- -----------------------------------------------------------------------------

local EntityFactory = {}
EntityFactory.__index = EntityFactory

function EntityFactory.new(entityMaster)
	local self = setmetatable({}, EntityFactory)
	self.entityMaster = entityMaster

	self.entityMaster = entityMaster
	self.ui = require("registries.uiReg")
	self.creatures = require("registries.creatureReg")
	self.tilesets = require("registries.tilesetReg")
	self.menuConfig = require("config.menuConfig")
	return self
end

-- create ui entities
function EntityFactory:menuUI(configKey)
	local config = self.menuConfig[configKey]

	if not config then
		return nil
	end

	local entityID = self.entityMaster:createEntity()
	self.entityMaster:addComponent(entityID, "Transform", {
		x = config.x,
		y = config.y,
	})

	-- add ui elements
	if config.elements then
		self.entityMaster:addComponent(entityID, "UIRender", {
			elements = config.elements,
			w = config.w,
			h = config.h,
		})
		if config.action then
			self.entityMaster:addComponent(entityID, "Interactable", {
				action = config.action,
			})
		end
	elseif config.text then
		self.entityMaster:addComponent(entityID, "TextRender", {
			text = config.text,
			font = config.font,
			align = config.align or "CENTER",
		})
	end

	return entityID
end

return EntityFactory
