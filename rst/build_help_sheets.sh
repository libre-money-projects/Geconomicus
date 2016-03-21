#!/bin/bash

DPI=300

# help sheet
HELP_SHEET_SVG_PATH="build/html/_images/help_sheet.svg"
HELP_SHEET_PNG_PATH="${HELP_SHEET_SVG_PATH%.svg}.png"

# markers
MARKERS_PATH="build/html/_static/cards/revolution"
HELP_SHEET_MARKERS_PATH="build/html/_static/help_sheets/help_sheet_markers.png"

# banknotes
BANKNOTES_PATH="build/html/_static/money"
HELP_SHEET_BANKNOTES_PATH="build/html/_static/help_sheets/help_sheet_banknotes.png"

# create PNG version of helpsheet
inkscape -d ${DPI} -z -f "${HELP_SHEET_SVG_PATH}" -e "${HELP_SHEET_PNG_PATH}"

# create markers help sheet
convert "${HELP_SHEET_PNG_PATH}" \
\( "${MARKERS_PATH}/marker_1.png" -rotate 270 \) -geometry +50+300 -composite \
\( "${MARKERS_PATH}/marker_2.png" -rotate 270 \) -geometry +1200+300 -composite \
\( "${MARKERS_PATH}/marker_3.png" -rotate 270 \) -geometry +2350+300 -composite \
\( "${MARKERS_PATH}/marker_4.png" -rotate 270 \) -geometry +1200+1300 -composite \
"${HELP_SHEET_MARKERS_PATH}"

# create banknotes help sheet
convert "${HELP_SHEET_PNG_PATH}" \
\( "${BANKNOTES_PATH}/red_banknote_modern_preview.png" \) -geometry +100+450 -composite \
\( "${BANKNOTES_PATH}/yellow_banknote_modern_preview.png" \) -geometry +1250+450 -composite \
\( "${BANKNOTES_PATH}/green_banknote_modern_preview.png" \) -geometry +2400+450 -composite \
\( "${BANKNOTES_PATH}/blue_banknote_modern_preview.png" \) -geometry +1250+1450 -composite \
"${HELP_SHEET_BANKNOTES_PATH}"
