#!/bin/bash
set -e

ls

echo "Copying repo files into container"
cp -r /github/workspace/. ./.blueprint/dev/

echo "Running blueprint build"
blueprint -build

identifier=$(grep -m 1 "identifier:" ./.blueprint/dev/conf.yml | cut -d ":" -f2 | xargs)

echo "Copying output back to workspace"
cp "./${identifier}.blueprint" "/github/workspace/${identifier}.blueprint"

# Set output if needed
echo "blueprint_file=${identifier}.blueprint" >> $GITHUB_OUTPUT
