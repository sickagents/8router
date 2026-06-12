#!/bin/bash

echo "=== Checking for potential issues ==="

# Check for remaining 9router references
echo -e "\n1. Checking for remaining 9router references..."
REMAINING=$(find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec grep -l "9router" {} \; 2>/dev/null | wc -l)
echo "   Found: $REMAINING files"

# Check for syntax errors in key files
echo -e "\n2. Checking package.json syntax..."
if node -e "require('./package.json')" 2>/dev/null; then
  echo "   ✅ package.json valid"
else
  echo "   ❌ package.json has syntax errors"
fi

# Check for port conflicts
echo -e "\n3. Checking port configuration..."
grep -r "20128" . --include="*.js" --include="*.json" --include="*.mjs" 2>/dev/null | head -5

# Check image file
echo -e "\n4. Checking image files..."
if [ -f "images/8router.png" ]; then
  echo "   ✅ images/8router.png exists"
else
  echo "   ⚠️  images/8router.png not found"
  ls images/*.png 2>/dev/null | head -3
fi

# Check README title
echo -e "\n5. Checking README title..."
head -10 README.md | grep -i "router"

echo -e "\n=== Check complete ==="
