#!/usr/bin/env bash

DPI=300

# help sheet
HELP_SHEET_SVG_PATH="build/html/_static/help_sheets/help_sheet.svg"
HELP_SHEET_PNG_PATH="${HELP_SHEET_SVG_PATH%.svg}.png"

# markers
MARKERS_PATH="build/html/_static/cards/revolution"
HELP_SHEET_MARKERS_PATH="build/html/_static/help_sheets/help_sheet_markers.png"

# banknotes
BANKNOTES_PATH="build/html/_static/money"
HELP_SHEET_BANKNOTES_PATH="build/html/_static/help_sheets/help_sheet_banknotes.png"

# create PNG print version of helpsheet
inkscape -d ${DPI} -z -f "${HELP_SHEET_SVG_PATH}" -e "${HELP_SHEET_PNG_PATH}"

# create markers help sheet
# resize to 75 dpi sizes
convert "${HELP_SHEET_PNG_PATH}" -resize 877x620 \
\( "${MARKERS_PATH}/marker_1.png" -resize 205x280 -rotate 270 \) -geometry +30+80 -composite \
\( "${MARKERS_PATH}/marker_2.png" -resize 205x280 -rotate 270 \) -geometry +315+80 -composite \
\( "${MARKERS_PATH}/marker_3.png" -resize 205x280 -rotate 270 \) -geometry +595+80 -composite \
\( "${MARKERS_PATH}/marker_4.png" -resize 205x280 -rotate 270 \) -geometry +315+330 -composite \
"${HELP_SHEET_MARKERS_PATH}"

# create banknotes help sheet
# resize to 75 dpi sizes
convert "${HELP_SHEET_PNG_PATH}" -resize 877x620 \
\( "${BANKNOTES_PATH}/red_banknote_modern_preview.png" \) -geometry +30+115 -composite \
\( "${BANKNOTES_PATH}/yellow_banknote_modern_preview.png" \) -geometry +315+115 -composite \
\( "${BANKNOTES_PATH}/green_banknote_modern_preview.png" \) -geometry +595+115 -composite \
\( "${BANKNOTES_PATH}/blue_banknote_modern_preview.png" \) -geometry +315+365 -composite \
"${HELP_SHEET_BANKNOTES_PATH}"
