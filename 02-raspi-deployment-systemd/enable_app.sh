#!/bin/bash

set -e

PYTHONEXEC=${1:-"$(which python3.9)"}
sed -i "s@PYTHONEXEC@$PYTHONEXEC@g" "$PWD"/lumber.service
sed -i "s@WORKDIR@$PWD@g" "$PWD"/lumber.service
sudo ln -fs "$PWD"/lumber.service /etc/systemd/system/lumber.service
sudo systemctl enable lumber.service