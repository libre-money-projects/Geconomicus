#!/usr/bin/env sh

current_dir=$(pwd)
cd rst;

echo " "
echo "-------------------"
echo "build html document"
echo "___________________"
make html;

echo " "
echo "-------------------"
echo "generate logo and favicon"
echo "___________________"
./build_logo.sh

echo " "
echo "-------------------"
echo "generate money in png from svg in html"
echo "___________________"
./build_money.sh

echo " "
echo "-------------------"
echo "generate \"revolution\" cards set from inkscape layers"
echo "___________________"
# create folder for cards sets
mkdir -p ./build/html/_static/cards
# really building cards now
# ./build_cards.py ./source/_static/cards/revolution ./build/html/_static/cards

echo " "
echo "-------------------"
echo "generate help sheets from cards and money"
echo "___________________"
./build_help_sheets.sh

cd ${current_dir};
