#!/bin/bash

set -e

PYTHONEXEC=${1:-"${which python3.9}"}

echo "Starting Lumber Service"
export PYTHONUNBUFFERED=1
$PYTHONEXEC $PWD/main.py