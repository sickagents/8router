#!/bin/bash
set -e

echo "Renaming 8router to 8router and port 20127 to 20127..."

# Find and replace in files
find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" -o -name "*.json" -o -name "*.md" -o -name "*.mjs" -o -name "*.sh" -o -name "*.yml" -o -name "*.yaml" \) ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/dist/*" ! -path "*/.next/*" -exec sed -i 's/8router/8router/g' {} \;

find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" -o -name "*.json" -o -name "*.md" -o -name "*.mjs" -o -name "*.sh" -o -name "*.yml" -o -name "*.yaml" \) ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/dist/*" ! -path "*/.next/*" -exec sed -i 's/8Router/8Router/g' {} \;

find . -type f \( -name "*.js" -o -name "*.jsx" -o -name "*.ts" -o -name "*.tsx" -o -name "*.json" -o -name "*.md" -o -name "*.mjs" -o -name "*.sh" -o -name "*.yml" -o -name "*.yaml" \) ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/dist/*" ! -path "*/.next/*" -exec sed -i 's/20127/20127/g' {} \;

# Rename image file if exists
if [ -f "images/8router.png" ]; then
  mv images/8router.png images/8router.png
fi

echo "Done! All references updated."
