-- =============================================================================
-- states/menuState.lua
-- -----------------------------------------------------------------------------
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and ControlSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- -----------------------------------------------------------------------------

local menuState = {}
local RS = {}
local CS = {}
local EF = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------
function menuState.load()
	-- load systems
	local EntityMaster = require("core.EntityMaster")
	local RenderSys = require("sys.RenderSys")
  local ControlSys = require("sys.ControlSys")

	-- initialize entity factory
	local menuConfig = require("config.menuConfig")
	local EntityFactory = require("core.EntityFactory")
	EntityFactory:setConfig(menuConfig)

	-- create systems
	local EM = EntityMaster.new()
	RS = RenderSys.new(EM)
	CS = ControlSys.new(EM)
	EF = EntityFactory.new(EM)

	-- create menu ui entities from config
	EF:assembleEntity("title")
	EF:assembleEntity("startButton")
	EF:assembleEntity("bgColor")

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
	RS:drawMenuState()
end

-- =============================================================================
-- menu.keyreleased()
-- -----------------------------------------------------------------------------
function menuState.keyreleased(key)
	CS:action(key)
end

return menuState
