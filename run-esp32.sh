#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./run-esp32.sh /dev/ttyUSB0"
    exit 1
fi

export IDF_PATH="$(pwd)/esp-idf"
source $IDF_PATH/export.sh
cd build/firmware
python $IDF_PATH/components/esptool_py/esptool/esptool.py -p $1 write_flash @flash_project_args
python $IDF_PATH/tools/idf_monitor.py -p $1 firmware.elf
