#!/usr/bin/env bash

http_get() {
  local url=$1
  if curl --version &>/dev/null; then
    curl -fsSL $url
  elif wget --version &>/dev/null; then
    wget -q -O - $url
  else
    die "Need curl or wget"
  fi
}

download_url() {
  local version=$1
  local platform=$(platform)
  local archname=$(archname)
  http_get 'https://raw.githubusercontent.com/skaji/rakudo-releases/main/rakudo-releases.v1.csv' | \
    grep ,archive, | \
    grep ,moar, | \
    grep ",$platform," | \
    grep ",$archname," | \
    grep ",$version," | \
    cut -d, -f9
}

platform() {
  local uname=$(uname -s)
  if [[ $uname = "Darwin" ]]; then
    echo macos
  elif [[ $uname = "Linux" ]]; then
    echo linux
  else
    die "Unsupported platform '$uname'"
  fi
}

archname() {
  local uname=$(uname -m)
  if [[ $uname = "x86_64" ]]; then
    echo x86_64
  elif [[ $uname = "arm64" ]]; then
    echo arm64
  else
    die "Unsupported archname '$uname'"
  fi
}
