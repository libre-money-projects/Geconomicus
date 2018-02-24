#!/usr/bin/env sh

current_dir=$(pwd)
cd rst/build;

# zip the build html folder for release
zip -r geconomicus_fr_FR.zip html

# english translation
cd ${current_dir};

./build_en_US.sh

cd rst/build;

# zip the build html folder for release
zip -r geconomicus_en_US.zip html

cd ${current_dir};
