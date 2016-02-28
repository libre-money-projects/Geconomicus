#!/usr/bin/env bash

current_dir=$(pwd)
cd rst;

# build html document
make html;
# copy spreadsheets files in html
mkdir -p ./build/html/_static/spreadsheets
cp ../Ğeconomicus_spreadsheets/*.ods ./build/html/_static/spreadsheets/.

# generate money in png from svg in html
./build_money.sh

# copy png files in html
cp ../Geconomicus_money/generated_svg/*.png ./build/html/_static/money/.

# create fodler for cards sets
mkdir -p ./build/html/_static/cards

# generate "revolution" cards set from inkscape layers
./build_cards.py ./source/_static/cards/revolution ./build/html/_static/cards

cd ${current_dir};
