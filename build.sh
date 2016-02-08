#!/usr/bin/env bash

current_dir=$(pwd)
cd rst;
make html;
cd ${current_dir};
