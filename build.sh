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

# create folder for cards sets
mkdir -p ./build/html/_static/cards

# generate "revolution" cards set from inkscape layers
./build_cards.py ./source/_static/cards/revolution ./build/html/_static/cards

# generate help sheets from cards and money
./build_help_sheets.sh

cd ${current_dir};
