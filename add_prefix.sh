#!/bin/bash
shopt -s nullglob
echo "Please enter a file extension: "
read -r rozszerzenie
pliki=(*."${rozszerzenie}")
DATA="$(date +%Y-%m-%d)"

#sprawdzenie czy sa pliki
if [ "${#pliki[@]}" -eq 0 ]; then
 echo "No .${rozszerzenie} files found." >&2
 exit 1
fi

echo "Please enter a file prefix: (Press ENTER for ${DATA})"
read -r input
if [ -z "${input}" ]; then
 prefix="${DATA}"
else
 prefix="${input}"
fi

for plik in "${pliki[@]}"; do 
 nowa_nazwa="${prefix}-${plik}"
 if [ -e "${nowa_nazwa}" ]; then
  echo "Skipping ${plik}: ${nowa_nazwa} already exists" >&2
  continue
 fi
 echo "Renaming ${plik} to ${nowa_nazwa}"
 mv "${plik}" "${nowa_nazwa}"
done
exit 0
