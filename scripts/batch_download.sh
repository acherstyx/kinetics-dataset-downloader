#!/bin/bash
process_count=0
process_num=300 # multiprocess

while read one;
do
  echo $one

  wget -c -t 0 "$one" & # download command

  let process_count+=1
  running=`expr $process_count % $process_num`
  if [ $running -eq 0 ]; then wait; fi;
done < $1
wait

