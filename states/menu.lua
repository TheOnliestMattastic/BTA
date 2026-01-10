-- =============================================================================
-- states/menu.lua
-- WHAT: Main menu state (title screen, initial navigation)
-- =============================================================================

local RenderSys = require("sys.render")
local Roster = require("ecs.entityManager")
-- local G = require("lib.globals")
local menu = {}

local RS = {}

function menu.load()
	RS = RenderSys.new(Roster)
end

function menu.update(dt)
	RS:update()
end

function menu.draw()
	RS:drawMenuUI()
end


-- function menu.keyreleased(key)
-- 	if key == G.controls.ESC then
-- 		love.event.quit()
-- 		return
-- 	end
-- end

return menu
