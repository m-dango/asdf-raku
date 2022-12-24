#!/usr/bin/env bash

tar_filename() {
  echo rakudo.tar.gz
}

http_get() {
  local url=$1
  if curl --version &>/dev/null; then
    curl -fsSL $url
  elif wget --version &>/dev/null; then
    wget -q -O - $url
  else
    echo "'curl' or 'wget' required."
    exit 1
  fi
}

download_url() {
  local version=$1

  get_available_releases | \
    grep ",$version," | \
    cut -d, -f9
}

get_available_releases() {
  local platform="$(platform)"
  local archname="$(archname)"

  http_get 'https://raw.githubusercontent.com/skaji/rakudo-releases/main/rakudo-releases.v1.csv' | \
    grep ,archive, | \
    grep ,moar, | \
    grep ",$platform," | \
    grep ",$archname,"
}

platform() {
  local uname=$(uname -s)
  if [[ $uname = "Darwin" ]]; then
    echo macos
  elif [[ $uname = "Linux" ]]; then
    echo linux
  else
    echo "Unsupported platform '$uname'"
    exit 1
  fi
}

archname() {
  local uname=$(uname -m)
  if [[ $uname = "x86_64" ]]; then
    echo x86_64
  elif [[ $uname = "arm64" ]]; then
    echo arm64
  else
    echo "Unsupported archname '$uname'"
    exit 1
  fi
}
