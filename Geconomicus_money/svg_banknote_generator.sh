#!/bin/bash

# Génération des 4 couleurs de billets

# Blue
sed s/colorx/blue/g < billet.svg > generated_svg/blue_banknote.svg
sed -i -e s/colory/red/g generated_svg/blue_banknote.svg
sed -i -e s/namey/Rouges/g generated_svg/blue_banknote.svg
sed -i -e s/colorz/green/g generated_svg/blue_banknote.svg
sed -i -e s/namez/Vert/g generated_svg/blue_banknote.svg

# Green
sed s/colorx/green/g < billet.svg > generated_svg/green_banknote.svg
sed -i -e s/colory/blue/g generated_svg/green_banknote.svg
sed -i -e s/namey/Bleus/g generated_svg/green_banknote.svg
sed -i -e s/colorz/yellow/g generated_svg/green_banknote.svg
sed -i -e s/namez/Jaune/g generated_svg/green_banknote.svg

# Yellow
sed s/colorx/yellow/g < billet.svg > generated_svg/yellow_banknote.svg
sed -i -e s/colory/green/g generated_svg/yellow_banknote.svg
sed -i -e s/namey/Verts/g generated_svg/yellow_banknote.svg
sed -i -e s/colorz/red/g generated_svg/yellow_banknote.svg
sed -i -e s/namez/Rouge/g generated_svg/yellow_banknote.svg

# Red
sed s/colorx/red/g < billet.svg > generated_svg/red_banknote.svg
sed -i -e s/colory/yellow/g generated_svg/red_banknote.svg
sed -i -e s/namey/Jaunes/g generated_svg/red_banknote.svg
sed -i -e s/colorz/blue/g generated_svg/red_banknote.svg
sed -i -e s/namez/Bleu/g generated_svg/red_banknote.svg

