# Battle Tactics Arena — Development Log

## [2025-01-08] [14:00 - 16:30]

### What I Did

- **Documentation**: Created comprehensive README.md with gameplay overview, quick start guide, and architecture explanation
- **Code Standards**: Established AGENTS.md with Lua style guide, file header pattern (WHAT/WHY/HOW/NOTE), and development workflow
- **Code Review**: Added reminder comments to all core files (main.lua, conf.lua, lib/globals.lua, states/menu.lua, ui/text.lua, classes/Roster.lua, classes/MasterClass.lua)
- **Bug Documentation**: Identified and flagged critical bugs in Roster.lua (addAbility/removeAbility typos, alignment math issues in text.lua)
- **Branding**: Updated README with license summary and Shigeru Miyamoto quote

### Next Steps

- [ ] Implement game state with map rendering and turn system
- [ ] Fix identified bugs in Roster.lua (creature/creatures reference, abilties typo)
- [ ] Build button UI component (currently empty)
- [ ] Design and implement ability system
- [ ] Create character roster with distinct playstyles
- [ ] Implement Action Point economy in combat
- [ ] Add menu navigation and state transitions

---

## [2025-01-11] [ongoing]

### What I Did

- **Architecture Refactor**: Reorganized entire project structure for scalability
  - Moved ui/ → components/ (clearer naming)
  - Created ecs/ → core/ with EntityMaster and MasterClass (ECS foundation)
  - Established sys/ directory for game systems (renderSys, controlSys)
  - Moved data files to registries/ (creatureReg, tilesetReg, uiReg)

- **Systems Implementation**:
  - Implemented controlSys.lua with action mapping and state callbacks
  - Created renderSys.lua for centralized rendering and virtual resolution
  - Expanded buttons.lua UI component with styling and interaction support
  - Improved text.lua rendering with better alignment logic

- **Configuration & Standardization**:
  - Renamed modules to PascalCase convention (EntityMaster, MasterClass, EntityFactory)
  - Created menuConfig.lua and controlConfig.lua for centralized configuration
  - Renamed menu.lua → menuState.lua, game.lua → gameState.lua for consistency
  - Added .gitignore with proper exclusions (symlinked .notes, IDE settings, build artifacts)

- **Code Quality**:
  - Updated system-wide AGENTS.md to document symlink handling in .gitignore
  - Created comprehensive README.md for Steam + recruiter visibility
  - Added Shigeru Miyamoto quote to README

### Currently Working On

- **Menu Navigation**: Stateful menu with buttons and input handling
- **Game State Foundation**: Placeholder for combat loop and turn system
- **Entity Factory**: Creature instantiation and composition
- **UI Polish**: Menu transitions and visual feedback

### Next Steps

- [ ] Complete gameState with map initialization
- [ ] Implement turn-based combat loop
- [ ] Build creature roster with 30+ characters
- [ ] Design action point economy mechanics
- [ ] Create ability system with casting/targeting
- [ ] Add pause menu and settings state
- [ ] Implement win/lose conditions

---

## [2025-01-13] [ongoing]

### What I Did

- **Architecture Clarification**: Deepened understanding of ECS principles vs. organizational conventions
  - Discussed component vs. factory distinction (not purely file-based, but architectural role)
  - Established guidelines: components *represent* entity attributes; factories/systems *create/process* entities
  - Decided to keep Gui.lua combined for engine UX convenience (valid hobbiest deviation from strict pattern)

- **Documentation Updates**: 
  - Added WHAT/WHY/HOW/NOTE headers to all 18 .lua files (consistent with AGENTS.md standard)
  - Updated AGENTS.md with complete Architecture Overview section (ECS pattern, key modules, file structure)
  - Added "Component vs. Factory Guidelines" section clarifying design decisions
  - Expanded "Architecture Principles" to emphasize composability and centralized APIs
  - Added "Current Development Status" section with completed vs. in-progress items

- **README.md Overhaul**:
  - Repositioned project focus toward architecture and development practices
  - Added Architecture section explaining ECS principles and module organization
  - Changed status section to "Current Status — Early Stage" with ✅ completed and 🚧 in-progress markers
  - Moved gameplay features to "Gameplay (Planned)" section to clarify they're aspirational
  - Removed "Targeting Steam publication in 2026" (more honest about early-stage status)
  - Added Development section with code style guidelines and AGENTS.md reference

### Key Insights

- **Convention vs. Principle**: File organization is an implementation detail; ECS cares about queryability, composability, and logic separation
- **Hobbiest QOL**: Justified combining Gui.lua as a UX convenience for the engine's API (similar to Unity's ButtonBundle pattern)
- **Documentation as Design**: Keeping AGENTS.md and README.md in sync forces clarity about architectural decisions and project maturity

### Next Steps

- [ ] Implement game state with creature spawning
- [ ] Build grid-based movement system
- [ ] Create combat loop with action point economy
- [ ] Implement ability system and creature roster
- [ ] Add turn-based state machine
- [ ] Create save/load system
- [ ] Implement audio system

---

## [2025-01-23] [ongoing]

### What I Did

- **Input System Refactor**: Split monolithic ControlSys into two focused systems
  - Created **InputSys**: Maps keyboard input to game actions via controlConfig
  - Created **EventSys**: Manages event queue and dispatches to action handlers via dispatch table
  - Improves separation of concerns and allows easy addition of new actions without modifying input handling

- **Component Naming Clarity**: 
  - Renamed Transform → Position → **Coords** for screen positioning (clearer intent)
  - Created dedicated Coords.lua component file
  - Updated RenderSys, EntityFactory, and menuState to use Coords consistently

- **Entity Factory Pattern Implementation**:
  - Refactored EntityFactory.create() to accept config inline instead of requiring setConfig()
  - Added quad generation for button spritesheets (support for multi-frame button states)
  - Consolidated text and button component setup in factory
  - Improved factory flexibility for different entity types

- **Menu State Integration**:
  - Restructured menuState.load() for cleaner dependency initialization
  - Added proper callbacks: update(), resize(), keypressed(), keyreleased()
  - Implemented canvas support for menu rendering
  - Connected EventSys:update() to game loop

- **Documentation & Code Quality**:
  - Added WHAT/WHY/HOW/NOTE headers to InputSys, EventSys, RenderSys, conf.lua
  - Added inline function comments explaining purpose of each code block
  - Standardized file header formatting across all systems
  - Cleaned up formatting and removed debug print statements

- **Asset Management**:
  - Removed underscores from UI sprite filenames for consistency (button_idle.png → buttonIdle.png, etc.)

### Currently Working On

- **Button Rendering**: Skeleton code for button quad rendering in RenderSys (in progress)
- **Menu Navigation**: Full event flow from input → action → handler

### Next Steps

- [ ] Complete button rendering with spritesheet quads
- [ ] Implement CONFIRM, SELECT, MOVE_UP/DOWN handlers in EventSys
- [ ] Add menu navigation state (highlight selected button, mouse support)
- [ ] Build gameState initialization and game loop
- [ ] Implement creature spawning and grid system
- [ ] Create turn-based combat loop with action points
- [ ] Build ability system and roster management

### Key Insights

- **Event-Driven Architecture**: Separating input mapping from event handling makes the codebase more flexible and testable
- **Component Naming Matters**: "Coords" is more intuitive than "Position" for screen positioning (vs. game world positions)
- **Inline Comments**: Adding code block comments significantly improves readability without being verbose

---

**Status**: Input/event system refactored and documented. Menu state structure complete with proper systems integration. Ready to implement button interactions and game state.
