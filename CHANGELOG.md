# Changelog
All notable changes will be documented in this file.  
Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),  
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.2] - 2025-11-05
### Changed
- **Refined and modernized CLI interface**
  - Introduced a unified **UI utilities module** (`src/utils/ui.ts`) for boxed layouts, dividers, and code blocks
  - Enhanced all command outputs for a cleaner and more professional look

- **Improved logger and command presentation**
  - Standardized success, warning, and error messages
  - Added bordered sections and headers for improved readability

- **Updated all commands to use the new UI**
  - `ai`: Boxed output with section headers and styled code blocks  
  - `edit`: Boxed diff display, statistics, and summary boxes  
  - `generate`: Styled spinners and section headers  
  - `config`: Boxed configuration output  
  - `update`: Polished update notifications with consistent colors

- **Refined main CLI entry (`bin/zultra.ts`)**
  - Replaced figlet banner with a professional Zultra banner  
  - Improved help display and spacing for readability

### Technical Notes
- No new commands or breaking changes introduced.
- Internal refactor focused on **UI consistency, color harmony, and branding polish**.
- CLI now provides a more professional and cohesive developer experience.

## [2.0.1] - 2025-11-05
### Changed
- **Refactored build system** to fully complete ESBuild bundling process  
  - Finalized `esbuild` integration with improved output and file permissions  
  - Removed leftover native build references and ensured unified JS-only distribution  
- **Improved development workflow**  
  - Added simplified `npm run dev` for testing CLI commands locally  
  - Enhanced compatibility for both Windows and Termux environments  

### Technical Notes
- This update finalizes the migration away from native binaries to a pure ESBuild-based bundle.
- No breaking changes introduced; existing CLI commands remain fully compatible.

## [2.0.0] - 2025-11-05
### Changed
- **Replaced native binary builds (`nexe`) with esbuild bundling**
  - CLI is now distributed as a single, minified JavaScript file instead of a compiled binary
  - Greatly simplifies build and publish workflows while reducing package size
- **Aligned build and release process** across both repos:
  - `zultra-core` now uses `.sh` scripts to manage esbuild-based builds and synced releases
  - `zultra-ai` (public repo) follows the same lightweight `esbuild` bundling pattern for NPM/GitHub
- Updated `package.json` build and publish scripts for the new JS-based setup
- Updated `files` and `bin` entries to point to the new bundled output (`dist/cli.js`)
- Removed all `nexe`-related configurations, scripts, and dependencies

### Removed
- Dropped native binary compilation and related dependencies (`nexe`, build configs, binary outputs)
- Removed all obsolete build and publish scripts referencing native binaries

### Breaking Changes
- The CLI is no longer shipped as a compiled native executable; it now runs as a Node-based JS bundle.  
  Any automation or deployment relying on the old binary format must update to the new distribution.

## [1.3.0] - 2025-11-03
### Added
- Introduced **native binaries** feature for improved CLI startup performance
- Updated build and publish scripts to support binary bundling

### Changed
- Bumped version to `1.3.0` (minor release)
- Improved TypeScript build and deployment workflow

## [1.2.2] - 2025-11-03
### Changed
- Migrated entire codebase from **JavaScript to TypeScript**
- Updated build system to use **TypeScript (`tsc`)** instead of obfuscation pipeline
- Simplified sync and publish process for the public repo (no `bin/` folder required)
- Refactored all build scripts for TypeScript compatibility
- Updated `package.json` scripts and dependencies for TypeScript workflow

### Added
- New TypeScript configuration file (`tsconfig.json`)
- Type-safe command and service modules under `src/`
- Automated build and publish scripts (`zultra-public.sh`, `zultra-publish.sh`) adapted for TypeScript

### Removed
- Removed `bin/` folder from build and publish flow (now handled by compiled `dist/`)
- Removed JavaScript obfuscation from build process for cleaner, maintainable output

## [1.2.0] - 2025-11-02
### Changed
- Switched build output and sync target from `src/` to `dist/`
- Build process now copies `src/` to a temp dir before obfuscation into `dist/`
- Auto-updates `bin/zultra.js` to point imports from `src/` → `dist/`
- Updated `package.json` `"files"` field to ship `dist/` instead of `src/`

### Added
- Automated cleanup to remove `src/` from temp before syncing to public repo
- Auto-remove legacy `src/` folder from public repo if it exists

## [1.1.2] - 2025-11-02
### Fixed
- Fixed module resolution error by including `src/` directory in the npm package
- Updated `package.json` `"files"` field to include source files
- Ensured `bin/` and `src/` sync correctly from core to public package

## [1.1.1] - 2025-11-02
### Fixed
- Initial public publish & setup fixes
- Added missing LICENSE formatting adjustments

## [1.1.0] - 2025-11-02
### Added
- Usage examples for the `edit` command to improve clarity for new users

### Changed
- Renamed `LICENSE.md` to `LICENSE` to follow standard open-source conventions
