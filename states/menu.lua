-- =============================================================================
-- states/menu.lua
-- WHAT: Main menu state (title screen, initial navigation)
-- =============================================================================

local RenderSys = require("sys.renderSys")
local EM = require("ecs.entityMaster")
local Control = require("config.controls")
local CS = require("sys.controlSys")
local menu = {}

local RS = {}
local Ctrls = {}

function menu.load()
	RS = RenderSys.new(EM)
	Ctrls = CS.new(EM, Control)
end

function menu.update(dt)
	RS:update()
end

function menu.draw()
	RS:drawMenuUI()
end

function menu.keyreleased(key)
	for i in pairs(Ctrls.keys) do
		if key == Ctrls.keys[i] then
			Ctrls:action(key)
		end
	end
end

return menu
