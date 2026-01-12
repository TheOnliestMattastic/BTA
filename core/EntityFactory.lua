-- =============================================================================
-- core/EntityFactory.lua
-- WHAT: Factory for creating entities from config templates
-- -----------------------------------------------------------------------------

local EntityFactory = {}
EntityFactory.__index = EntityFactory

-- components
local Text = require("components.Text")
local Button = require("components.Buttons")

-- registries
local ui = require("registries.uiReg")
local entities = require("registries.creatureReg")
local tilesets = require("registries.tilesetReg")

-- config/templates
local menuConfig = require("config.menuConfig")

function EntityFactory.new(entityMaster)
	local self = setmetatable({}, EntityFactory)
	self.entityMaster = entityMaster
	return self
end

-- create ui entities
function EntityFactory:menuUI(configKey)
	local entity = menuConfig[configKey]

	if not entity then
		return nil
	end

	-- ---------------------------------------------------------------------------
	-- add components
	-- ---------------------------------------------------------------------------
	local entityID = self.entityMaster:createEntity()

	-- transform
	self.entityMaster:addComponent(entityID, "Transform", {
		x = entity.x,
		y = entity.y,
	})

	-- button
	if entity.button then
		local btnData = ui[entity.button]
		self.entityMaster:addComponent(entityID, "Button", Button.new(btnData))
	end

	-- interactable
	if entity.action then
		self.entityMaster:addComponent(entityID, "Interactable", {
			action = entity.action,
		})
	end

	-- text
	if entity.text then
    --stylua: ignore
		if not entity.font then entity.font = "fontM" end
		local fontData = ui[entity.font].img

    -- stylua: ignore
		self.entityMaster:addComponent(entityID, "Text", Text.new(
		  entity.text,
      fontData,
		  entity.xOffset or 0.5
		))
	end

	return entityID
end

return EntityFactory
