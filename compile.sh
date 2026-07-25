typst compile spellcards.typ --format png --ppi 1000 spells/{0p}.png
for i in spells/*.png; do ffmpeg -i "$i" -s 480x800 "${i%.*}.bmp"; done
trash spells/*.png
