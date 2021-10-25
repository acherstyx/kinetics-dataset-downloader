#!/bin/bash
cd train
for folder in ./*; do
  if test -d "$folder"; then
    echo "$folder"
    cd "$folder"
    files=$(echo *.mp4)
    if [ "${files}" != '*.mp4' ]; then
      nohup sh -c 'for i in *.mp4; do ffmpeg -loglevel error -stats -i "./$i" -filter:v scale=-1:360 -c:a copy ./"$(echo $i | sed "s/.mp4$/.avi/")" -y;rm "./$i" ;done' >> ../convert.out &
    fi
    cd ..
  fi
done