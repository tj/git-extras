#!/usr/bin/env bash

err() {
    echo >&2 "$1"
    exit 1
}

if command -v shellcheck > /dev/null ; then
  # Check all changed shell scripts
  if ! git diff -z --name-only "$TRAVIS_BRANCH...HEAD" | xargs -0 ./shellcheck.sh ; then
    err "Please fix the shellcheck issues"
  fi
fi
