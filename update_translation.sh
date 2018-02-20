#!/usr/bin/env sh

current_dir=$(pwd)
cd rst;

# update pot files in build/locale
make gettext

# update po files from pot files in source/locale
sphinx-intl update -p build/locale -d source/locale/ -l en_US

cd ${current_dir};
