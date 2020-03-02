#!/bin/bash
export IDF_PATH="$(pwd)/esp-idf"
source $IDF_PATH/export.sh
rm -rf build/firmware && mkdir -p build/firmware && cd build/firmware
cmake ../../src/ -DCMAKE_TOOLCHAIN_FILE=$IDF_PATH/tools/cmake/toolchain-esp32.cmake -DTARGET=esp32 -GNinja
cmake --build .
