#!/usr/bin/env bash

set -e

has_local() {
  local _has_local
}

has_local 2> /dev/null || alias local=typeset

err() {
  local red
  local reset
  red=$(tput setaf 1 2> /dev/null || echo '')
  reset=$(tput sgr0 2> /dev/null || echo '')
  echo "${red}error${reset}: $1" >&2
  exit 1
}

DOTFILE_DIR="$HOME/dotfile"

cd "$DOTFILE_DIR"

if ! git pull upstream main; then
  echo "upstream pull failed, trying origin/main" >&2
  if ! git pull origin main; then
    err "Failed to pull from upstream/main or origin/main"
  fi
fi

ansible-playbook -i localhost, init.yaml
