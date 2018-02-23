#!/usr/bin/env sh

current_dir=$(pwd)
cd rst;

echo "build html document"
make html;

echo "generate logo and favicon"
./build_logo.sh

echo "generate help sheets from cards and money"
./build_help_sheets.sh

echo "generate money in png from svg in html"
./build_money.sh

echo "create folder for cards sets"
mkdir -p ./build/html/_static/cards
# echo "generate \"revolution\" cards set from inkscape layers"
# ./build_cards.py ./source/_static/cards/revolution ./build/html/_static/cards

cd ${current_dir};
