#!/usr/bin/env bash

err() {
    echo >&2 "$1"
    exit 1
}

if ! command -v column >/dev/null 2>&1; then
    err "Need to install dependency 'column' before installation (can be found in bsdmainutils)"
fi
