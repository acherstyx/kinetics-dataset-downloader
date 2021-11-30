#!/bin/bash
mkdir data
cd data || exit

# download link list
bash "../scripts/batch_download.sh" ../links.txt || exit

echo "download"
subsets="train test val"
for subset in $subsets; do
  echo "download ${subset}"
  mkdir "$subset"
  cd "$subset" || exit
  bash "../../scripts/batch_download.sh" "../k400_${subset}_path.txt"
  cd ..
done

echo "extract"
for subset in $subsets; do
  echo "extract ${subset}"
  cd "$subset" || exit
  bash ../../scripts/batch_extract.sh "../k400_${subset}_path.txt"
  cd ..
done

for subset in $subsets; do
  echo "mkdir ${subset}"
  python3 ../make_subdirectory.py "${subset}.csv" "./${subset}/"
done
