# Changelog
All notable changes will be documented in this file.
Format based on Keep a Changelog.

## [Unreleased]

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
