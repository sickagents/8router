#!/bin/bash
set -e

echo "Sanitizing OAuth secrets..."

# Replace Google OAuth secrets
find . -type f \( -name "*.js" -o -name "*.ts" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec sed -i \
  's/681255809395-oo8ft2oprdrnp9e3aqf6av3hmdib135j\.apps\.googleusercontent\.com/YOUR_GOOGLE_CLIENT_ID/g' {} \;

find . -type f \( -name "*.js" -o -name "*.ts" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec sed -i \
  's/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/YOUR_GOOGLE_CLIENT_SECRET/g' {} \;

find . -type f \( -name "*.js" -o -name "*.ts" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec sed -i \
  's/1071006060591-tmhssin2h21lcre235vtolojh4g403ep\.apps\.googleusercontent\.com/YOUR_GOOGLE_CLIENT_ID_2/g' {} \;

find . -type f \( -name "*.js" -o -name "*.ts" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec sed -i \
  's/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/YOUR_GOOGLE_CLIENT_SECRET_2/g' {} \;

echo "Done! Secrets sanitized."
