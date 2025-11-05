#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔍 VERIFYING NPM PACKAGE CONTENTS...${NC}"
echo ""

REQUIRED_FILES=("package.json" "zultra.js" "README.md" "LICENSE")
MISSING_FILES=()

for file in "${REQUIRED_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "${GREEN}✓${NC} Found: $file"
  else
    echo -e "${RED}✗${NC} Missing: $file"
    MISSING_FILES+=("$file")
  fi
done

if [ -d "zultra" ]; then
  BINARY_COUNT=$(find zultra -type f \( -name "zultra" -o -name "zultra.exe" \) 2>/dev/null | wc -l)
  if [ "$BINARY_COUNT" -gt 0 ]; then
    echo -e "${GREEN}✓${NC} Found: zultra/ directory with $BINARY_COUNT binaries"
    echo -e "${BLUE}  Platforms:${NC}"
    find zultra -type d -mindepth 1 -maxdepth 1 2>/dev/null | while read -r platform_dir; do
      platform=$(basename "$platform_dir")
      binary_file=$(find "$platform_dir" -type f \( -name "zultra" -o -name "zultra.exe" \) 2>/dev/null | head -n 1)
      if [ -n "$binary_file" ]; then
        size=$(du -h "$binary_file" 2>/dev/null | cut -f1 || echo "unknown")
        echo -e "    - $platform ($size)"
      fi
    done
  else
    echo -e "${RED}✗${NC} zultra/ directory exists but contains no binaries"
    MISSING_FILES+=("zultra binaries")
  fi
else
  echo -e "${RED}✗${NC} Missing: zultra/ directory"
  MISSING_FILES+=("zultra/")
fi

echo ""

if [ ${#MISSING_FILES[@]} -gt 0 ]; then
  echo -e "${RED}❌ CANNOT PUBLISH: Missing required files${NC}"
  for file in "${MISSING_FILES[@]}"; do
    echo "  - $file"
  done
  exit 1
fi

echo -e "${GREEN}✅ ALL REQUIRED FILES PRESENT${NC}"
echo ""

if [ -f "package.json" ]; then
  PACKAGE_NAME=$(node -p "require('./package.json').name" 2>/dev/null || echo "unknown")
  PACKAGE_VERSION=$(node -p "require('./package.json').version" 2>/dev/null || echo "unknown")

  echo -e "${BLUE}Package:${NC} $PACKAGE_NAME"
  echo -e "${BLUE}Version:${NC} $PACKAGE_VERSION"
  echo ""
fi

read -r -n 1 -p "$(echo -e ${YELLOW}Proceed with npm publish? [Y/n]${NC} )" CONFIRM
echo

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]] && [[ -n "$CONFIRM" ]]; then
  echo -e "${YELLOW}⚠️  PUBLISH CANCELLED${NC}"
  exit 0
fi

echo -e "${BLUE}📦 PUBLISHING TO NPM...${NC}"
echo ""

if npm publish --access public; then
  echo ""
  echo -e "${GREEN}✅ SUCCESSFULLY PUBLISHED TO NPM!${NC}"
  echo ""
  echo -e "${BLUE}Next steps:${NC}"
  echo "  1. Verify package on npm: https://www.npmjs.com/package/$PACKAGE_NAME"
  echo "  2. Test installation: npm install -g $PACKAGE_NAME"
  echo "  3. Tag the release on GitHub"
  echo ""
else
  echo ""
  echo -e "${RED}❌ NPM PUBLISH FAILED${NC}"
  echo ""
  echo -e "${YELLOW}Common reasons:${NC}"
  echo "  - Version already exists (bump version in package.json)"
  echo "  - Not logged in to npm (run: npm login)"
  echo "  - Insufficient permissions"
  echo ""
  exit 1
fi
