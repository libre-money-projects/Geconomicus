#!/bin/bash

# Génération des 4 couleurs de billets

# Blue
sed -e s/colorx/blue/g < billet.svg > generated_svg/blue_banknote.svg
sed -i -e s/namex/B/g generated_svg/blue_banknote.svg
sed -i -e s/colory/red/g generated_svg/blue_banknote.svg
sed -i -e s/namey/R/g generated_svg/blue_banknote.svg
sed -i -e s/colorz/green/g generated_svg/blue_banknote.svg
sed -i -e s/namez/V/g generated_svg/blue_banknote.svg

# Green
sed -e s/colorx/green/g < billet.svg > generated_svg/green_banknote.svg
sed -i -e s/namex/V/g generated_svg/green_banknote.svg
sed -i -e s/colory/blue/g generated_svg/green_banknote.svg
sed -i -e s/namey/B/g generated_svg/green_banknote.svg
sed -i -e s/colorz/yellow/g generated_svg/green_banknote.svg
sed -i -e s/namez/J/g generated_svg/green_banknote.svg

# Yellow
sed -e s/colorx/yellow/g < billet.svg > generated_svg/yellow_banknote.svg
sed -i -e s/namex/J/g generated_svg/yellow_banknote.svg
sed -i -e s/colory/green/g generated_svg/yellow_banknote.svg
sed -i -e s/namey/V/g generated_svg/yellow_banknote.svg
sed -i -e s/colorz/red/g generated_svg/yellow_banknote.svg
sed -i -e s/namez/R/g generated_svg/yellow_banknote.svg

# Red
sed -e s/colorx/red/g < billet.svg > generated_svg/red_banknote.svg
sed -i -e s/namex/R/g generated_svg/red_banknote.svg
sed -i -e s/colory/yellow/g generated_svg/red_banknote.svg
sed -i -e s/namey/J/g generated_svg/red_banknote.svg
sed -i -e s/colorz/blue/g generated_svg/red_banknote.svg
sed -i -e s/namez/B/g generated_svg/red_banknote.svg

