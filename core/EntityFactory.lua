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

-- set per state
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

-- create entities from config
function EntityFactory:create(key, config)
	local entity = config[key]

	if not entity then
		return nil
	end

	-- ---------------------------------------------------------------------------
	-- add components
	-- ---------------------------------------------------------------------------

	-- backgrounds
	local entityID = self.entityMaster:createEntity()
	if entity.r and entity.g and entity.b then
		self.entityMaster:addComponent(
			entityID,
			"Background",
			Gui.newBgColor(entity.r, entity.g, entity.b, entity.a or 1)
		)
	end

	-- coordinates
	if entity.x and entity.y then
		self.entityMaster:addComponent(entityID, "Coords", Coords.new(entity.x or 0, entity.y or 0))
	end

	-- text
	if entity.text then
		if not entity.font then
			entity.font = "fontM"
		end
		entity.font = self.registries.ui[entity.font]
		self.entityMaster:addComponent(
		  entityID,
		  "Text",
		  Gui.newText(entity.text, entity.font, entity.xOffset or 0.5)
		)
	end

	-- button
	if entity.button then
		entity.data = self.registries.ui[entity.button]
		entity.quads = {}
		entity.img = love.graphics.newImage(entity.data.img)
		local states = entity.img:getWidth() / entity.data.frameW
		for state = 0, states - 1 do
			entity.quads[state] =
				love.graphics.newQuad(state * entity.data.frameW, 0, entity.data.frameW, entity.data.frameH, entity.img)
		end
		self.entityMaster:addComponent(
			entityID,
			"Button",
			Gui.newButton(
			  entity.data,
			  entity.img,
			  entity.quads,
			  entity.w,
			  entity.h,
			  entity.xOffset
			)
		)
	end

	-- action
	if entity.action then
		self.entityMaster:addComponent(entityID, "Interactable", {
			action = entity.action,
		})
	end
	return entityID
end

return EntityFactory
