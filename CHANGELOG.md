# Changelog
All notable changes will be documented in this file.  
Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),  
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
