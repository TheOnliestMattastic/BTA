-- =============================================================================
-- main.lua
-- -----------------------------------------------------------------------------
-- WHAT: Entry point for game; loads registries, manages state transitions
-- WHY: Initializes game engine and wires up state machine for menu/game modes
-- HOW: Requires registries/configs, creates EntityFactory, implements love.* lifecycle callbacks
-- NOTE: State callbacks (load, update, draw, keyreleased, keypressed) delegated to active state
-- -----------------------------------------------------------------------------

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
	-- load dependencies
	local uiReg = require("registries.uiReg")
	local creatureReg = require("registries.creatureReg")
	local tilesetsReg = require("registries.tilesetReg")
	local EntityFactory = require("core.EntityFactory")

	-- initialize entity factory
	EntityFactory:setRegistries(uiReg, creatureReg, tilesetsReg)

	-- switch state
	SwitchState("menu")
end

-- =============================================================================
-- pass love.update to states
-- -----------------------------------------------------------------------------

function love.update(dt)
	if currentState and currentState.update then
		currentState.update(dt)
	end
end

-- =============================================================================
-- pass love.draw to states
-- -----------------------------------------------------------------------------

function love.draw()
	if currentState and currentState.draw then
		currentState.draw()
	end
end

-- =============================================================================
-- pass input to states
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
