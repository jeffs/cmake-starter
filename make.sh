#!/bin/sh

bin=$(dirname "$0")

if [ ! -d build ]; then
    "$bin"/init.sh
fi

ninja -C build "$@"
