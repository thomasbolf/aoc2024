#!/bin/bash
recent_folder=$(ls | grep "day*" | sort | tail -n -1 | grep -o "[0-9]*")
next_day=$((recent_folder + 1))
mkdir "day$next_day"
echo $next_day
curl https://adventofcode.com/2024/day/$next_day/input -b "session=$AOC_SESSION" > day$next_day/input.txt 
 
