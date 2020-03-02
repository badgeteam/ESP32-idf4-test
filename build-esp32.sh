#!/bin/bash
export IDF_PATH="$(pwd)/esp-idf"
source $IDF_PATH/export.sh > /dev/null
rm -rf build/firmware && mkdir -p build/firmware
cp sdkconfig build/firmware/sdkconfig > /dev/null
cd build/firmware

cmake ../../src/ -DCMAKE_TOOLCHAIN_FILE=$IDF_PATH/tools/cmake/toolchain-esp32.cmake -DTARGET=esp32 -GNinja
cmake --build .
