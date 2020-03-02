#!/bin/bash
mkdir -p build/firmware
cp sdkconfig build/firmware/sdkconfig > /dev/null
export IDF_PATH="$(pwd)/esp-idf"
source esp-idf/export.sh > /dev/null
idf.py -C src -B build/firmware -v menuconfig
cp build/firmware/sdkconfig sdkconfig
