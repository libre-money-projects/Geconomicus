#!/bin/bash

# convert SVG to PNG with inkscape
for file in build/html/_static/money/*.svg
do
     inkscape -d 300 -z -f "${file}" -e "${file%.svg}.png"
done
