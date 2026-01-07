-- =============================================================================
-- classes/Roster.lua
-- WHAT: Entity manager; attaches and tracks components
-- -----------------------------------------------------------------------------

local Roster = {}
Roster.__index = Roster

function Roster.new()
	local self = setmetatable({}, Roster)
	self.nextCreatureID = 1
	self.creatures = {}
	self.abilities = {}
	return self
end

-- create new creature and return ID
function Roster:createCreature()
	local id = self.nextCreatureID
	self.nextCreatureID = self.nextCreatureID + 1
	self.creatures[id] = true
	return id
end

-- remove creature
function Roster:removeCreature(creatureID)
	self.creatures[creatureID] = nil
	for abilityType, _ in pairs(self.abilities) do
		self.abilities[abilityType][creatureID] = nil
	end
end

-- attach  abilities to creatures
function Roster:addAbility(creatureID, abilityType, abilityData)
	if not self.creature[abilityType][creatureID] then
		self.abilities[abilityType] = {}
	end
	self.abilities[abilityType][creatureID] = abilityData
end

-- remove abilities from creature
function Roster:removeAbility(creatureID, abilityType)
	if self.abilties[abilityType] then
		self.abilties[abilityType][creatureID] = nil
	end
end

-- get abilities from a creature
function Roster:getAbility(creatureID, abilityType)
	if self.abilities[abilityType] then
		return self.abilities[abilityType][creatureID]
	end
	return nil
end

-- get all creatures with specified ability
function Roster:getCreaturesWith(abilityType)
	local result = {}
	if self.abilities[abilityType] then
		for creatureID, _ in pairs(self.abilities[abilityType]) do
			table.insert(result, creatureID)
		end
	end
end

-- get all creatures with all specified abilities
function Roster:getCreaturesWithAll(...)
	local abilityTypes = { ... }
	local result = {}

	for creatureID, _ in ipairs(self.creatures) do
		local hasAll = true
		for _, abilityType in ipairs(abilityTypes) do
			if not self:hasAbility(creatureID, abilityType) then
				hasAll = false
				break
			end
		end
		if hasAll then
			table.insert(result, creatureID)
		end
	end

	return result
end

return Roster
