-- =============================================================================
-- classes/EntityMaster.lua
-- WHAT: Entity manager; tracks entities and their components (component system)
-- WHY: Centralized storage for game entities and their behavioral components
-- HOW: Maps entities to component types; supports queries for entities with components
-- =============================================================================

local EntityMaster = {}
EntityMaster.__index = EntityMaster

function EntityMaster.new()
	local self = setmetatable({}, EntityMaster)
	self.nextEntityID = 1
	self.entities = {}
	self.components = {}
	return self
end

-- create new entity and return ID
function EntityMaster:createEntity()
	local id = self.nextEntityID
	self.nextEntityID = self.nextEntityID + 1
	self.entities[id] = true
	return id
end

-- remove entity
function EntityMaster:removeEntity(entityID)
	self.entities[entityID] = nil
	for componentType, _ in pairs(self.components) do
		self.components[componentType][entityID] = nil
	end
end

-- attach  components to entities
function EntityMaster:addComponent(entityID, componentType, componentData)
	if not self.components[componentType] then
		self.components[componentType] = {}
	end
	self.components[componentType][entityID] = componentData
end

-- remove components from entity
function EntityMaster:removeComponent(entityID, componentType)
	if self.components[componentType] then
		self.components[componentType][entityID] = nil
	end
end

-- get components from a Entity
function EntityMaster:getComponent(entityID, componentType)
	if self.components[componentType] then
		return self.components[componentType][entityID]
	end
	return nil
end

-- get all entities with specified component
function EntityMaster:getEntitiesWith(componentType)
	local result = {}
	if self.components[componentType] then
		for entityID, _ in pairs(self.components[componentType]) do
			table.insert(result, entityID)
		end
	end
  return result
end

-- get all entities with all specified components
function EntityMaster:getEntitiesWithAll(...)
	local componentTypes = { ... }
	local result = {}

	for entityID, _ in ipairs(self.entities) do
		local hasAll = true
		for _, componentType in ipairs(componentTypes) do
			if not self:hasComponent(entityID, componentType) then
				hasAll = false
				break
			end
		end
		if hasAll then
			table.insert(result, entityID)
		end
	end

	return result
end

return EntityMaster
