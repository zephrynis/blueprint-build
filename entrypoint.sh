#!/bin/bash
set -e

echo "Copying repo files into container"
cp -R /github/workspace/ /app/.blueprint/dev/

echo "Patching export script"
sed -i '4d' /app/scripts/commands/developer/export.sh

cd /app/.blueprint/dev
ls

cd /app/

echo "Running blueprint export"
blueprint -export

identifier=$(grep -m 1 "identifier:" /app/.blueprint/dev/conf.yml | cut -d ":" -f2 | xargs)

echo "Copying output back to workspace"
cp "/app/${identifier}.blueprint" "/github/workspace/${identifier}.blueprint"

# Set output if needed
echo "blueprint_file=${identifier}.blueprint" >> $GITHUB_OUTPUT
