#!/usr/bin/env bash

current_dir=$(pwd)
cd rst/build;

mv html geconomicus

# zip the build html folder for release
zip -r geconomicus.zip geconomicus

mv geconomicus html

cd ${current_dir};
