#!/bin/sh

cmake -H. -Bbuild -G Ninja

if [ ! -e input ]; then
    touch input
fi
