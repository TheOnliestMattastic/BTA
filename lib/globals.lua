-- =============================================================================
-- lib/globals.lua
-- WHAT: Centralized global dependency management (virtual screen, controls)
-- =============================================================================

local G = {}

-- core
G.virtual = require("lib.virtual")
G.controls = require("config.controls")

return G
