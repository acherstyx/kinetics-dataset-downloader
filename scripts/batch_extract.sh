#!/bin/bash
process_count=0
process_num=10 # multi =process

while read -r one;
do
  echo "${one##*/}"
  sh -c "tar zxvf "${one##*/}"; rm "${one##*/}"" &

  let process_count+=1
  running=$(expr $process_count % $process_num)
  if [ "$running" -eq 0 ]; then wait; fi;
done < "$1"

wait