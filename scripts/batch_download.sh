#!/bin/bash

aria2c -c --input-file="$1" -j 100 -x 10
