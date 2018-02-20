#!/usr/bin/env sh

current_dir=$(pwd)
cd rst;

# GENERATE MO FILES
sphinx-intl build --locale-dir source/locale

# HTML
# use tag for only directives (adapt image sizes for output)
make html SPHINXOPTS="-t html -D language='en_US'"

cd ${current_dir};
