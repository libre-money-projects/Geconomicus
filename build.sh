#!/usr/bin/env bash

current_dir=$(pwd)
cd rst;
make html;
cp ../Ğeconomicus_spreadsheets/*.ods ./build/html/_static/spreadsheets/.
cd ${current_dir};
