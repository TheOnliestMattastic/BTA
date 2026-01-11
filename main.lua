-- =============================================================================
-- main.lua
-- WHAT: Core game loop and state management for Battle Tactics Arena
-- WHY: Centralized lifecycle and state transitions using Love2D callbacks
-- HOW: Implements love.load/update/draw/keypressed hooks; routes to state modules
-- NOTE: State manager is inline; consider extracting to lib/StateManager.lua
-- =============================================================================

-- =============================================================================
-- state manager
-- TODO: extract into module
-- =============================================================================

local currentState = nil
local loadedStates = {}

function SwitchState(stateName)
	local state
	if stateName == "menu" then
		local menu = require("states.menuState")
		state = menu
	elseif stateName == "game" then
		local game = require("states.gameState")
		state = game
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
