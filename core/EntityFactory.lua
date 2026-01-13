-- =============================================================================
-- core/EntityFactory.lua
-- WHAT: Factory pattern for creating and populating game entities from config
-- WHY: Decouples entity creation from game logic; allows data-driven UI/entity setup
-- HOW: Reads config tables and creates entities with Transform, Button, Text, Interactable components
-- NOTE: Requires EntityMaster instance; setRegistries() and setConfig() must be called before use
-- =============================================================================

local EntityFactory = {}
EntityFactory.__index = EntityFactory
EntityFactory.registries = {}
EntityFactory.configs = {}

-- components
local Gui = require("components.Gui")

function EntityFactory.new(entityMaster)
	local self = setmetatable({}, EntityFactory)
	self.entityMaster = entityMaster
	return self
end

function EntityFactory:setRegistries(uiRegistry, entityRegistry, tilesetRegistry)
	self.registries.ui = uiRegistry
	self.registries.creatures = entityRegistry
	self.registries.tileset = tilesetRegistry
end

function EntityFactory:setConfig(config)
	self.configs = config
end

-- create ui entities
function EntityFactory:menuUI(configKey)
	local entity = self.configs[configKey]

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
		local btnData = self.registries.ui[entity.button]
		self.entityMaster:addComponent(entityID, "Button", Gui.newButton(btnData))
	end

	-- interactable
	if entity.action then
		self.entityMaster:addComponent(entityID, "Interactable", {
			action = entity.action,
		})
	end

	-- text
	if entity.text then
		if not entity.font then
			entity.font = "fontM"
		end
		local fontData = self.registries.ui[entity.font]

    -- stylua: ignore
		self.entityMaster:addComponent(entityID, "Text", Gui.newText(
		  entity.text,
      fontData,
		  entity.xOffset or 0.5
		))
	end

	return entityID
end

return EntityFactory
