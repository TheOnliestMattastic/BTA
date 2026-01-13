-- =============================================================================
-- core/GameMaster.lua
-- WHAT: Central game engine; exports ECS system, entity/animation/rendering libraries
-- WHY: Single import point for all core systems, making game initialization cleaner
-- HOW: Bundles SystemsMaster, EntityFactory, EntityMaster, and lib (virtual, anim8)
-- NOTE: Also exports sys modules (ControlSys, RenderSys); requires stylua: ignore
-- =============================================================================

local GameMaster = {}

-- core
GameMaster.SystemsMaster = require("core.SystemsMaster")
GameMaster.EntityFactory = require("core.EntityFactory")
GameMaster.EntityMaster = require("core.EntityMaster")

-- lib
GameMaster.virtual = require("lib.virtual")
GameMaster.anim8 = require("lib.anim8")

-- sys
GameMaster.controlSys = require("sys.controlSys")
GameMaster.renderSys = require("sys.renderSys")

return GameMaster
