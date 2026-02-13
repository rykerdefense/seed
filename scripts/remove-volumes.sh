#!/usr/bin/env zsh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJ_DIR=$(dirname $SCRIPT_DIR);

# Get IDs of all container volumes
ids=$(docker volume ls | tr '\t' ' ' | tr -s ' ' | cut -d' ' -f2 | grep -v 'VOLUME')

# Remove volumes using the --force flag
for cmd in ${(f)ids};do zsh -c "docker volume rm $cmd -f" || continue;done
