-- =============================================================================
-- main.lua
-- WHAT: Entry point for game; loads registries, manages state transitions
-- WHY: Initializes game engine and wires up state machine for menu/game modes
-- HOW: Requires registries/configs, creates EntityFactory, implements love.* lifecycle callbacks
-- NOTE: State callbacks (load, update, draw, keyreleased, keypressed) delegated to active state
-- =============================================================================

local uiReg = require("registries.uiReg")
local creatureReg = require("registries.creatureReg")
local tilesetsReg = require("registries.tilesetReg")
local menuConfig = require("config.menuConfig")

local EntityFactory = require("core.EntityFactory")
EntityFactory:setRegistries(uiReg, creatureReg, tilesetsReg)
EntityFactory:setConfig(menuConfig)

-- state manager
-- TODO: extract into module
local currentState = nil
local loadedStates = {}

function SwitchState(stateName)
	local state
	if stateName == "menu" then
		local menuState = require("states.menuState")
		state = menuState
	elseif stateName == "game" then
		local gameState = require("states.gameState")
		state = gameState
	else
		error("Unknown state: " .. tostring(stateName))
	end

	currentState = state
	if not loadedStates[stateName] and currentState.load then
		loadedStates[stateName] = true
		local ok, err = pcall(currentState.load)
		if not ok then
			loadedStates[stateName] = nil
			error(err)
		end
	end
end

-- =============================================================================
-- love.load
-- -----------------------------------------------------------------------------

function love.load()
	SwitchState("menu")
end

-- =============================================================================
-- love.update
-- -----------------------------------------------------------------------------

function love.update(dt)
	if currentState and currentState.update then
		currentState.update(dt)
	end
end

-- =============================================================================
-- love.draw
-- -----------------------------------------------------------------------------

function love.draw()
	if currentState and currentState.draw then
		currentState.draw()
	end
end

-- =============================================================================
-- input
-- -----------------------------------------------------------------------------

function love.keyreleased(key)
	if currentState and currentState.keyreleased then
		currentState.keyreleased(key)
	end
end

function love.keypressed(key)
	if currentState and currentState.keypressed then
		currentState.keypressed(key)
	end
end
