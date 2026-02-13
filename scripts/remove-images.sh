#!/usr/bin/env zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJ_DIR=$(dirname $SCRIPT_DIR);

# Get IDs of all container images
ids=$(docker images | tr '\t' ' ' | tr -s ' ' | cut -d' ' -f2 | grep -v 'ID')

# Remove images using the --force flag
for cmd in ${(f)ids};do zsh -c "docker rmi $cmd -f" || continue;done
