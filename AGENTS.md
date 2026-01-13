# BTA Development Guidelines

Project-specific conventions and workflows for Battle Tactics Arena development.

## Architecture Overview

**ECS (Entity-Component-System) Pattern**:
- **Entities**: Game objects identified by unique IDs
- **Components**: Data structures (Transform, Button, Text, HitPoints, GridPosition, etc.)
- **Systems**: Logic processors (RenderSys, ControlSys, and future GameLogicSys)
- **EntityMaster**: Central registry; tracks all entities and components
- **EntityFactory**: Creates entities from config data (UI menus, creatures, etc.)

**Key Modules**:
- `core/`: GameMaster (central export), EntityMaster, EntityFactory, SystemsMaster
- `registries/`: Asset definitions (uiReg, creatureReg, tilesetReg)
- `config/`: Game data (menuConfig, controlConfig)
- `states/`: Game modes (menuState, gameState)
- `sys/`: Game systems (RenderSys, ControlSys)
- `components/`: Component definitions (Text, Button, Transform, etc.)

## Git & Commits

**Branch strategy**: Feature branches for all work.

```bash
git checkout -b feat/grid-movement
git checkout -b fix/input-handling
```

Merge to `main` only after code review and approval.

**Conventional commit format:**

```
type(scope): subject (max 50 chars)

body (optional, wrap at 72 chars)
```

Examples:

- `feat(menu): add main menu UI with state machine`
- `feat(ecs): implement entity query system`
- `fix(render): correct text positioning with virtual resolution`
- `refactor(input): standardize control system architecture`
- `docs: update AGENTS.md with ECS guidelines`

**Workflow**: Code → push to feature branch → request review from Amp → review code/log/diff → receive approval message → commit (do not push)

**Commit frequency**: Logical chunks—when a feature or fix is complete, not per file.

## Code Standards

### Lua Style

- **Naming**: `camelCase` for functions/variables, `PascalCase` for classes/modules
- **Indentation**: Tabs (configured in stylua)
- **Formatter**: `stylua .` (run before each commit)

### File Header Pattern

All `.lua` files should start with:

```lua
-- =============================================================================
-- path/to/file.lua
-- WHAT: Brief description of what this module does
-- WHY:  Why it's needed in the architecture
-- HOW:  Brief technical explanation
-- NOTE: Gotchas, dependencies, or important reminders
-- =============================================================================
```

**Guidelines:**

- Pick 1-3 sections that add non-redundant info (don't repeat obvious intent)
- Keep each section to ~1 line
- Skip sections only if truly obvious from code

### Comments in Code Blocks

Add brief comments above major logic blocks:

```lua
-- Query all entities with Text component and render them
local textEntities = self.entityMaster:getEntitiesWith("Text")
for _, id in ipairs(textEntities) do
  -- ...
end
```

**Guidelines:**

- Explain _why_, not _what_ (code shows what)
- Mark TODOs and known bugs with `-- TODO:` comments
- Keep comments brief (1-2 lines per block)

## Architecture Principles

1. **ECS-driven design**: Clear separation of data (components) from logic (systems)
2. **State-based flow**: Game modes (menu, gameplay) are discrete states with load/update/draw
3. **Configuration-driven**: Game data (fonts, tiles, creatures, controls, UI layout) lives in `config/` and `registries/`
4. **Virtual resolution**: All rendering targets 1024x768; Love2D handles scaling
5. **Composability**: Components are independent; systems query for specific combinations
6. **Centralized APIs**: GameMaster and EntityFactory provide clean entry points

## Component vs. Factory Guidelines

**Components** (e.g., Text.lua, Button.lua, HitPoints.lua):
- Represent entity attributes/data
- Have `.new(...)` factory methods to create instances
- May have behavior methods that operate on the component (e.g., `HitPoints.takeDamage()`)
- Queryable by systems; attached to entities via EntityMaster

**Factories/Systems** (e.g., EntityFactory, RenderSys):
- Create or process entities/components
- Not attached to entities; not queryable
- Infrastructure/engine code, not game data

**Decision rule**: If it represents something an entity *is*, it's a component. If it *creates* or *processes* entities, it's engine infrastructure.

## Development Workflow

### Before Starting Work

- Check git log: `git log --oneline -10`
- Create feature branch: `git checkout -b feat/descriptive-name`
- Review relevant code and TODOs

### During Development

- Run frequently: `./love.appimage .`
- Write in small, testable increments
- Test manually in-game
- Keep file headers and comments updated
- Run formatter: `stylua .`

### Submitting for Review

- Push to feature branch: `git push origin feat/your-feature`
- Request review from Amp in thread
- Amp reviews code, architecture, diff, and git log
- Receive approval → commit (do not push after commit)

## Current Development Status

**Completed**:
- ECS architecture (EntityMaster, EntityFactory, SystemsMaster)
- Menu state with UI rendering (title, buttons)
- Input system (ControlSys) with vim-style keybinds
- Registries for UI, creatures, and tilesets
- Virtual resolution system
- Configuration system (controls, menu layout)

**In Progress / TODO**:
- Game state implementation and logic
- Creature system (spawning, stat management)
- Grid-based movement and pathfinding
- Combat system (action points, damage calculation)
- Ability system
- Roster management
- Full character roster implementation
- Save/load system
- Audio system

---

**Last updated:** 2025-01-13
