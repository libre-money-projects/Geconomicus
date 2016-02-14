#!/usr/bin/env bash

current_dir=$(pwd)
cd rst;
make html;
mkdir -p ./build/html/_static/spreadsheets
cp ../Ğeconomicus_spreadsheets/*.ods ./build/html/_static/spreadsheets/.
cd ${current_dir};
