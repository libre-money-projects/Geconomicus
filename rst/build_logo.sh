#!/bin/bash

DPI=300
SHADOW_OFFSET=6

# convert SVG to PNG with inkscape
for file in build/html/_static/logo/*.svg
do
    # inkscape convert svg to png
    inkscape -d ${DPI} -z -f "${file}" -w 400 -h 400 -e "${file%.svg}.png"
    mv ${file%.svg}.png build/html/_static
    inkscape -d ${DPI} -z -f "${file}" -w 32 -h 32 -e "${file%.svg}_favicon.png"
    mv ${file%.svg}_favicon.png build/html/_static
done
