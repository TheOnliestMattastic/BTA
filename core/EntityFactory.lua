-- =============================================================================
-- core/EntityFactory.lua
-- -----------------------------------------------------------------------------
-- WHAT: Factory pattern for creating and populating game entities from config
-- WHY: Decouples entity creation from game logic; allows data-driven UI/entity setup
-- HOW: Reads config tables and creates entities with Transform, Button, Text, Interactable components
-- NOTE: Requires EntityMaster instance; setRegistries() and setConfig() must be called before use
-- -----------------------------------------------------------------------------

local EntityFactory = {}
EntityFactory.__index = EntityFactory
EntityFactory.registries = {}
EntityFactory.configs = {}

-- components
local Gui = require("components.Gui")
local Coords = require("components.Coords")

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
function EntityFactory:create(configKey)
	local entity = self.configs[configKey]

	if not entity then
		return nil
	end

	-- ---------------------------------------------------------------------------
	-- add components
	-- ---------------------------------------------------------------------------

	-- backgrounds
	local entityID = self.entityMaster:createEntity()
	if entity.r then
		self.entityMaster:addComponent(entityID, "Background", Gui.newBgColor(entity.r, entity.g, entity.b, entity.a))
	end

	-- coordinates
	if entity.x and entity.y then
		self.entityMaster:addComponent(entityID, "Coords", Coords.new(entity.x or 0, entity.y or 0))
	end

	-- button
	if entity.button then
		local btnData = self.registries.ui[entity.button]
		self.entityMaster:addComponent(entityID, "Button", Gui.newButton(btnData, entity.w, entity.h, btnData.frames))
	end

	-- action
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
		entity.font = fontData
		self.entityMaster:addComponent(entityID, "Text", Gui.newText(entity.text, entity.font, entity.xOffset or 0.5))
	end

	return entityID
end

return EntityFactory
