#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔍 VERIFYING NPM PACKAGE CONTENTS...${NC}"
echo ""

# Files that must exist for publishing
REQUIRED_FILES=("package.json" "dist/zultra.js" "README.md" "LICENSE")
MISSING_FILES=()

# Check existence of required files
for file in "${REQUIRED_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "${GREEN}✓${NC} Found: $file"
  else
    echo -e "${RED}✗${NC} Missing: $file"
    MISSING_FILES+=("$file")
  fi
done

echo ""

# Fail early if any required file is missing
if [ ${#MISSING_FILES[@]} -gt 0 ]; then
  echo -e "${RED}❌ CANNOT PUBLISH: Missing required files${NC}"
  for file in "${MISSING_FILES[@]}"; do
    echo "  - $file"
  done
  exit 1
fi

echo -e "${GREEN}✅ ALL REQUIRED FILES PRESENT${NC}"
echo ""

# Display basic package info
if [ -f "package.json" ]; then
  PACKAGE_NAME=$(node -p "require('./package.json').name" 2>/dev/null || echo "unknown")
  PACKAGE_VERSION=$(node -p "require('./package.json').version" 2>/dev/null || echo "unknown")

  echo -e "${BLUE}Package:${NC} $PACKAGE_NAME"
  echo -e "${BLUE}Version:${NC} $PACKAGE_VERSION"
  echo ""
fi

# Confirm publish action
read -r -n 1 -p "$(echo -e ${YELLOW}Proceed with npm publish? [Y/n]${NC} )" CONFIRM
echo

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]] && [[ -n "$CONFIRM" ]]; then
  echo -e "${YELLOW}⚠️  PUBLISH CANCELLED${NC}"
  exit 0
fi

echo -e "${BLUE}📦 PUBLISHING TO NPM...${NC}"
echo ""

# Run npm publish
if npm publish --access public; then
  echo ""
  echo -e "${GREEN}✅ SUCCESSFULLY PUBLISHED TO NPM!${NC}"
  echo ""
  echo -e "${BLUE}Next steps:${NC}"
  echo "  1. Verify package: https://www.npmjs.com/package/$PACKAGE_NAME"
  echo "  2. Test install: npm install -g $PACKAGE_NAME"
  echo "  3. Tag the release on GitHub"
  echo ""
else
  echo ""
  echo -e "${RED}❌ NPM PUBLISH FAILED${NC}"
  echo ""
  echo -e "${YELLOW}Common issues:${NC}"
  echo "  - Version already exists (bump version)"
  echo "  - Not logged in (npm login)"
  echo "  - Insufficient permissions"
  echo ""
  exit 1
fi
