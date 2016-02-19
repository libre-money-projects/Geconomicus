#!/bin/bash

# Génération des pgn en 300 dpi. Commande à lancer : sudo bash svg_to_pgn_generator.sh

for file in *.svg
do
     inkscape -d 300 -z -f "${file}" -e "${file%.svg}.png"
done
