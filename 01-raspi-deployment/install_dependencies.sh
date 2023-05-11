#!/bin/bash

set -e

sudo apt update

readonly luxonis_pkgs=(
  libhdf5-dev
  libhdf5-dev
  libatlas-base-dev
  libilmbase-dev
  libopenexr-dev
  libgstreamer1.0-dev
  build-essential
  libgtk2.0-dev
  pkg-config
  libavcodec-dev
  libavformat-dev
  libswscale-dev
  python3-dev
  libtbb2
  libtbb-dev
  libjpeg-dev
  libpng-dev
  libtiff-dev
)

readonly pkgs=(
  ${luxonis_pkgs[@]}
  exfat-fuse
  exfat-utils
  python3.9
  python3.9-dev
  python3-pip
  python3.9-venv
)

sudo apt-get install -y "${pkgs[@]}"
