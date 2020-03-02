#!/bin/bash
git submodule update --init --recursive || exit 1
cd esp-idf
./install.sh
