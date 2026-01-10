-- =============================================================================
-- sys/renderSys.lua
-- WHAT: System to draw onto the screen
-- -----------------------------------------------------------------------------

-- inherit from MasterClass
local MC = require("core.masterClass")
local RenderSys = setmetatable({}, { __index = MC })
RenderSys.__index = RenderSys

local G = require("lib.globals")
local Text = require("components.text")
local Button = require("components.buttons")

local menuCanvas
local menuBtn

function RenderSys.new(entityMaster)
	local self = setmetatable(MC.new(entityMaster), RenderSys)
	menuCanvas = love.graphics.newCanvas(G.virtual.WIDTH, G.virtual.HEIGHT)
	G.virtual.scaleScreen()
	menuBtn = Button.add(G.ui.button_1)
	return self
end

function RenderSys:drawMenuUI()
	love.graphics.setCanvas(menuCanvas)
	love.graphics.clear(0.3, 0.4, 0.4)
	Text.add("Battle Tactics Arena", G.virtual.WIDTH / 2, G.virtual.HEIGHT / 3, Text.FONT.XL, Text.ALIGN.CENTER)
	Button.draw(menuBtn, G.virtual.WIDTH / 2, (G.virtual.HEIGHT / 4) * 3, G.virtual.WIDTH / 3, G.virtual.HEIGHT / 4)
	love.graphics.setCanvas()
	if G.virtual.scale and G.virtual.scale > 0 then
		love.graphics.draw(menuCanvas, G.virtual.translateX, G.virtual.translateY, 0, G.virtual.scale, G.virtual.scale)
	end
end

function RenderSys:update(dt)
	G.virtual.scaleScreen()
end

return RenderSys
