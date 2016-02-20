#!/usr/bin/env bash

current_dir=$(pwd)
cd rst;

# build html document
make html;
# copy spreadsheets files in html
mkdir -p ./build/html/_static/spreadsheets
cp ../Ğeconomicus_spreadsheets/*.ods ./build/html/_static/spreadsheets/.

# generate png from svg in html
./svg_to_png.sh

# copy png files in html
cp ../Geconomicus_money/generated_svg/*.png ./build/html/_static/money/.


cd ${current_dir};
