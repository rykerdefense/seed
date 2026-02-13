#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJ_DIR=$(dirname $SCRIPT_DIR);

docker build -t rykerwikijs $PROJ_DIR;

