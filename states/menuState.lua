-- =============================================================================
-- states/menuState.lua
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and ControlSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- =============================================================================

local RenderSys = require("sys.RenderSys")
local ControlSys = require("sys.ControlSys")
local EntityFactory = require("core.EntityFactory")

local menuState = {}
local RS = {}
local CS = {}
local EF = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------
function menuState.load()
	local uiReg = require("registries.uiReg")

	-- create systems
	local EntityMaster = require("core.EntityMaster")
	local EM = EntityMaster.new()
	RS = RenderSys.new(EM, uiReg)
	CS = ControlSys.new(EM)
	EF = EntityFactory.new(EM)

	-- create menu ui entities from config
	EF:menuUI("title")
	EF:menuUI("startButton")

	-- create canvas
end

-- =============================================================================
-- menu.update()
-- -----------------------------------------------------------------------------
function menuState.update(dt) end

-- =============================================================================
-- menu.draw()
-- -----------------------------------------------------------------------------
function menuState.draw()
	RS:drawState()
end

-- =============================================================================
-- menu.keyreleased()
-- -----------------------------------------------------------------------------
function menuState.keyreleased(key)
	CS:action(key)
end

return menuState
