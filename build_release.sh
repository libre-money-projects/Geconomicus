#!/usr/bin/env bash

current_dir=$(pwd)
cd rst/build;

mv html geconomicus

# zip the build html folder for release
zip -r geconomicus.zip geconomicus

cd ${current_dir};
