#!/bin/bash

# Génération des dos des cartes

sed s/levelx/bronze/g < carte_back.svg > generated_svg/carte_bronze_back.svg
sed -i -e s/textex/B/g generated_svg/carte_bronze_back.svg
sed -i -e s/fondx/#236467/g generated_svg/carte_bronze_back.svg

sed s/levelx/silver/g < carte_back.svg > generated_svg/carte_silver_back.svg
sed -i -e s/textex/S/g generated_svg/carte_silver_back.svg
sed -i -e s/fondx/#EB6800/g generated_svg/carte_silver_back.svg

sed s/levelx/gold/g < carte_back.svg > generated_svg/carte_gold_back.svg
sed -i -e s/textex/G/g generated_svg/carte_gold_back.svg
sed -i -e s/fondx/#AA6DA2/g generated_svg/carte_gold_back.svg

sed s/levelx/diamond/g < carte_back.svg > generated_svg/carte_diamond_back.svg
sed -i -e s/textex/D/g generated_svg/carte_diamond_back.svg
sed -i -e s/fondx/#EB6800/g generated_svg/carte_diamond_back.svg

# Génération des premières cartes

sed s/levelx/bronze/g < carte_front.svg > generated_svg/carte_bronze1.svg
sed -i -e s/textex/B/g generated_svg/carte_bronze1.svg
sed -i -e s/valuex/v1/g generated_svg/carte_bronze1.svg

sed s/levelx/silver/g < carte_front.svg > generated_svg/carte_silver1.svg
sed -i -e s/textex/S/g generated_svg/carte_silver1.svg
sed -i -e s/valuex/v1/g generated_svg/carte_silver1.svg

sed s/levelx/gold/g < carte_front.svg > generated_svg/carte_gold1.svg
sed -i -e s/textex/G/g generated_svg/carte_gold1.svg
sed -i -e s/valuex/v1/g generated_svg/carte_gold1.svg

sed s/levelx/diamond/g < carte_front.svg > generated_svg/carte_diamond1.svg
sed -i -e s/textex/D/g generated_svg/carte_diamond1.svg
sed -i -e s/valuex/v1/g generated_svg/carte_diamond1.svg

# Génération des 12 cartes suivantes (ou plus : rajouter des valeurs.svg dans generated_svg/values, et augmentez 'seq 2 max')

for i in `seq 2 13`;
do
   sed "s/v1/v$i/g" generated_svg/carte_bronze1.svg > generated_svg/carte_bronze$i.svg
   sed "s/v1/v$i/g" generated_svg/carte_silver1.svg > generated_svg/carte_silver$i.svg
   sed "s/v1/v$i/g" generated_svg/carte_gold1.svg > generated_svg/carte_gold$i.svg
   sed "s/v1/v$i/g" generated_svg/carte_diamond1.svg > generated_svg/carte_diamond$i.svg
done
