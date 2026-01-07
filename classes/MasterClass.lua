local MasterClass = {}
MasterClass.__index = MasterClass

function MasterClass.new(entityManager)
	local self = setmetatable({}, MasterClass)
	self.enabled = true
	self.roster = entityManager
end

function MasterClass:update(dt) end

function MasterClass:draw() end

function MasterClass:setEnabled(enabled)
	self.enabled = enabled
end

return MasterClass
