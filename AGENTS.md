# BTA Development Guidelines

Project-specific conventions and workflows for Battle Tactics Arena development.

## Git & Commits

**Branch strategy**: Feature branches for all work.

```bash
git checkout -b feat/combat-action-points
git checkout -b fix/roster-ability-bug
```

Merge to `main` only after code review and approval.

**Conventional commit format:**

```
type(scope): subject (max 50 chars)

body (optional, wrap at 72 chars)
```

Examples:

- `feat(combat): implement action point system`
- `fix(roster): correct ability lookup bug`
- `refactor(ui): extract text rendering to component`
- `docs: update README with gameplay features`

**Workflow**: Code → push to feature branch → request review from Amp → review code/log/diff → receive message for approval → commit (do not push)

**Commit frequency**: Logical chunks—when a feature or fix is complete, not per file.

## Code Standards

### Lua Style

- **Naming**: `camelCase` for functions/variables, `PascalCase` for classes
- **Indentation**: Tabs
- **Formatter**: stylua (run before commit)

### File Header Pattern

All `.lua` files should start with:

```lua
-- =============================================================================
-- path/to/file.lua
-- WHAT: Brief description of what this module does
-- WHY:  Why it's needed in the architecture
-- HOW:  Brief technical explanation
-- NOTE: Gotchas, gotchas, or important reminders
-- =============================================================================
```

**Guidelines:**

- Pick 1-3 sections that add non-redundant info (don't repeat obvious intent)
- Keep each section to 1 line if possible
- Skip sections if they're obvious from the code

### Comments in Code Blocks

Add brief comments above major codeblocks to remind what they do:

```lua
-- Load and initialize all creature abilities
for creatureID, _ in pairs(self.creatures) do
  -- ...
end
```

**Guidelines:**

- Explain _why_, not _what_ (the code shows what)
- Mark TODOs and known bugs with comments
- Keep comments brief

## Architecture Principles

1. **State-based design**: All game modes (menu, gameplay, etc.) are discrete states
2. **Component system**: Entities (creatures) attach abilities; Roster tracks them
3. **Configuration-driven**: Game data (fonts, tiles, characters) lives in `assets/config/`
4. **Virtual resolution**: All drawing targets 1024x768; Love2D scales output

## Workflow

### Before Starting Work

- Check current git status: `git log --oneline -10`
- Create feature branch: `git checkout -b feat/your-feature`
- Check open issues or TODOs in the code

### During Development

- Run the game frequently: `./love.appimage .` (or `love .`)
- Test manually and write unit tests if applicable (place in `/tests/`)
- Run stylua before pushing: `stylua .`

### Submitting for Review

- Push to feature branch: `git push origin feat/your-feature`
- Request review from Amp

---

**Last updated:** 2025-01-08
