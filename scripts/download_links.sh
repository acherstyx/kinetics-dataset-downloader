#!/bin/bash
while read link;
do
  echo $link
  wget $link &
done < $1
wait
