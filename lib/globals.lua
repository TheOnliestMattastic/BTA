-- =============================================================================
-- lib/Gals.lua
-- WHAT: Centeralized dependency management for the game
-- -----------------------------------------------------------------------------

local G = {}

-- constants
G.tile_size = 32

-- core
G.virtual = require("lib.virtual")
G.controls = require("config.controls")

return G
