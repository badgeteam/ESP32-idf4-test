#!/bin/bash
rm -rf build/emulator && mkdir -p build/emulator && cd build/emulator
cmake ../../src/
cmake --build .
