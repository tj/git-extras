#!/usr/bin/env bash

err() {
    echo >&2 "$1"
    exit 1
}

if ! test "$(which column)"; then
    err "Need to install dependency 'column' before installation"
fi
