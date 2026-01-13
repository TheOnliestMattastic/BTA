# Battle Tactics Arena: Remastered, Refactored, Reengineered

A turn-based tactical RPG built with **Love2D**. Battle Tactics Arena began as a Computer Science final project and is now being developed into a full-featured indie game with an ECS-based engine, grid-based combat, and 30+ unique characters.

## About

This project focuses on:
- **Custom ECS Architecture**: Built from scratch with EntityMaster, EntityFactory, and SystemsMaster
- **Clean Code Practices**: Modular design, configuration-driven data, and well-documented patterns
- **Tactical Gameplay**: Grid-based navigation, action point economy, and strategic positioning
- **Game Development Portfolio**: Demonstrating architecture, systems design, and hobby game development

## Quick Start

### Install & Play

```bash
# Extract and run:
./love.appimage .
```

### Requirements

- 64-bit Linux/Windows/macOS
- Love2D 11.5+ (included via love.appimage)
- ~50MB disk space

## Architecture

Built on **Entity-Component-System (ECS)** principles:

- **Entities**: Game objects (creatures, UI elements, tiles)
- **Components**: Data structures (Transform, HitPoints, GridPosition, Text, Button)
- **Systems**: Logic processors (RenderSys, ControlSys, future GameLogicSys)

Key modules:
- `core/`: ECS engine (EntityMaster, EntityFactory, GameMaster)
- `sys/`: Game systems (rendering, input, future game logic)
- `states/`: Game modes (menu, gameplay)
- `registries/`: Asset definitions (creatures, UI sprites, tilesets)
- `config/`: Data configuration (controls, menu layout)

See `AGENTS.md` for development guidelines and architecture details.

## Current Status

**Active Development — Early Stage**

### ✅ Completed
- ECS architecture and entity management
- Menu state with UI rendering
- Input system with vim-style keybinds (h/j/k/l navigation)
- Registries for creatures, UI assets, and tilesets
- Virtual resolution system (1024x768 target)

### 🚧 In Progress / TODO
- Game state implementation
- Creature spawning and stat management
- Grid-based movement and pathfinding
- Combat system (action points, damage calculation)
- Ability system and roster management
- Character roster implementation (30+ creatures defined)
- Save/load system
- Audio system

## Gameplay (Planned)

- **Grid-Based Combat**: Tactical positioning and movement
- **30+ Characters**: Warriors, Mages, Rogues, Healers, and more—each with unique stats and abilities
- **Action Point Economy**: Limited resources drive strategic decision-making
- **Turn-Based**: No time pressure—plan your moves carefully

## Development

### Running the Game
```bash
./love.appimage .
```

### Code Style
- **Language**: Lua
- **Naming**: `camelCase` for variables/functions, `PascalCase` for classes
- **Formatter**: stylua
- **Comments**: WHAT/WHY/HOW pattern in file headers; explain intent in code blocks

See `AGENTS.md` for full development workflow and conventions.

## License

**Commons Clause + MIT** — You're free to view, study, modify, and distribute the code for non-commercial purposes. Commercial use and sales are reserved for the original author. See LICENSE file for details.

---

**Made with ❤️ and Lua**  
Early-stage development; gameplay and balance subject to change.

> "It's fun to have fun but you have to know how." — Shigeru Miyamoto
