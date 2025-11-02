# Zultra AI

![](https://img.shields.io/badge/Node.js-18%2B-brightgreen?style=flat-square) [![npm]](https://www.npmjs.com/package/@zultra/ai)

[npm]: https://img.shields.io/npm/v/@zultra/ai.svg?style=flat-square

Zultra is an intelligent AI-powered developer assistant for the terminal. It helps you generate, modify, and document code effortlessly through natural language commands. Powered by Google's Gemini AI, Zultra streamlines your workflow by automating routine tasks, refactoring code, and generating documentation -- all from your command line.

Learn more in the [official documentation](https://zultra.dev/docs).

<img src="./demo.gif" />

## Get started

1. Install Zultra:

npm install -g @zultra/ai
2. Configure your API key:

zultra config set key YOUR_GEMINI_API_KEY
3. Start using Zultra in your project directory:

zultra help
## Features

- AI Code Generation: Generate code snippets and suggestions using natural language prompts
- Smart File Editing: Edit single or multiple files using glob patterns with AI assistance
- Documentation Generation: Automatically generate README files by scanning your codebase
- Diff Previews: Review changes before applying them with syntax-highlighted diffs
- Backup & Undo: Safely edit files with automatic backup creation and undo capabilities
- Batch Operations: Process multiple files at once using glob patterns
- Package Management: Easily add dependencies to package.json with AI assistance

## Available Commands

### zultra generate
Automatically generate README or documentation by scanning project files.

zultra generate --output README.md
### zultra ai <prompt>
Generate code or suggestions interactively using Zultra AI.

zultra ai "Create a React component for a login form"
### zultra edit <files> <instruction>
Edit or refactor one or multiple files using AI agents.

# Edit a single file
zultra edit src/api.js "Add error handling to all fetch calls"

# Edit multiple files with glob patterns
zultra edit "src/**/*.js" "Add JSDoc comments to all functions"

# Preview changes without applying
zultra edit src/utils.js --dry-run "Refactor to use async/await"

# Auto-confirm changes
zultra edit src/config.js --yes "Update production settings"

# Create backups before editing
zultra edit src/database.js --backup "Refactor connection logic"

# Add dependencies to package.json
zultra edit package.json --add express

# Undo last edit
zultra edit src/api.js --undo
Options:
- --dry-run: Preview changes without applying them
- --yes: Auto-confirm all changes without prompting
- --backup: Create automatic backups before editing
- --add: Add a dependency to package.json
- --create: Allow creating new files if they do not exist
- --undo: Undo the last edit for the specified file

### zultra config <action> [args]
Manage Zultra configuration and API keys.

zultra config set key YOUR_GEMINI_API_KEY
### zultra update
Check for available updates from npm registry.

zultra update
### zultra version
Display the current version of Zultra CLI.

zultra version
## Examples

Generate Documentation:
zultra generate
AI-Powered Code Generation:
zultra ai "Create a function to validate email addresses"
Refactor Multiple Files:
zultra edit "src/**/*.js" --backup "Convert all var declarations to const/let"
Add Package Dependencies:
zultra edit package.json --add axios
zultra edit package.json --add react-router-dom
Preview Changes:
zultra edit src/utils/helper.js --dry-run "Add input validation"
## Reporting Bugs

We welcome your feedback. If you encounter any issues, please file a [GitHub issue](https://github.com/zultra/zultra-ai/issues).

## Connect

Join the [Zultra Developers Community](https://t.me/zultradev) to connect with other builders using Zultra.

- [Telegram Community](https://t.me/zultradev)
- [Twitter](https://twitter.com/zultra_ai)

## Data Collection and Privacy

Zultra uses Google's Gemini API for AI-powered features. Your API key is stored locally in ~/.nuvon/config.json. No code or personal data is collected by Zultra itself.

For information about how Gemini processes your requests, please review [Google's Privacy Policy](https://policies.google.com/privacy).

---

© 2025 Zultra Labs. All rights reserved.