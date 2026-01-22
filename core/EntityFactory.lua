-- =============================================================================
-- core/EntityFactory.lua
-- WHAT: Creates entities from configuration by instantiating components
-- WHY:  Decouples entity creation logic from game code; allows data-driven entity definitions
-- HOW:  Takes a config key and registry data, creates entity in EntityMaster, attaches components based on config fields
-- NOTE: Registries must be set via setRegistries() before calling create()
-- =============================================================================

local EntityFactory = {}
EntityFactory.__index = EntityFactory
EntityFactory.registries = {}
EntityFactory.configs = {}

local Gui = require("components.Gui")
local Coords = require("components.Coords")

function EntityFactory.new(entityMaster)
	local self = setmetatable({}, EntityFactory)
	self.entityMaster = entityMaster
	return self
end

-- set in main.lua
function EntityFactory:setRegistries(uiRegistry, entityRegistry, tilesetRegistry)
	self.registries.ui = uiRegistry
	self.registries.creatures = entityRegistry
	self.registries.tileset = tilesetRegistry
end

-- Create entity from config table, instantiate components based on config fields
function EntityFactory:create(key, config)
	local entity = config[key]

	if not entity then
		return nil
	end

	local entityID = self.entityMaster:createEntity()

	-- Attach background color component if RGB values provided
	if entity.r and entity.g and entity.b then
		self.entityMaster:addComponent(
			entityID,
			"Background",
			Gui.newBgColor(entity.r, entity.g, entity.b, entity.a or 1)
		)
	end

	-- Attach position component for renderable entities
	if entity.x and entity.y then
		self.entityMaster:addComponent(entityID, "Coords", Coords.new(entity.x or 0, entity.y or 0))
	end

	-- Attach button component with sprite quads for animation states
	if entity.button then
		entity.data = self.registries.ui[entity.button]
		entity.img = love.graphics.newImage(entity.data.img)

		entity.quads = {}
		local states = entity.img:getWidth() / entity.data.frameW
		for state = 0, states - 1 do
			entity.quads[state] =
				love.graphics.newQuad(state * entity.data.frameW, 0, entity.data.frameW, entity.data.frameH, entity.img)
		end

		self.entityMaster:addComponent(
			entityID,
			"Button",
			Gui.newButton(entity.data, entity.img, entity.quads, entity.w, entity.h, entity.xOffset or 0.5)
		)
	end

	-- Attach text component for UI labels/text entities
	if entity.text then
		entity.font = self.registries.ui[entity.font] or self.registries.ui["fontL"]
		self.entityMaster:addComponent(entityID, "Text", Gui.newText(entity.text, entity.font, entity.xOffset or 0.5))
	end

	-- Attach interactable component for clickable/actionable entities
	if entity.action then
		self.entityMaster:addComponent(entityID, "Interactable", {
			action = entity.action,
		})
	end
	return entityID
end

return EntityFactory
