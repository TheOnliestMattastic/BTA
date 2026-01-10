-- =============================================================================
-- sys/render.lua
-- WHAT: System to draw onto the screen
-- -----------------------------------------------------------------------------

local MC = require("ecs.MasterClass")
local Render = setmetatable({}, { __index = MC })
Render.__index = Render

function Render.new(roster, ui)
	local self = setmetatable(MC.new(roster, ui), Render)
	return self
end

function Render:drawMenuUI() end

function Render:draw() end
