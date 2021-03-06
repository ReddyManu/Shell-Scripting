#!/bin/bash

# In Loops, there are two major types - while & for

# while loop works on expressions that we used in if statements

a=10
while [ $a -gt 0 ]
do
  echo While Loop
  sleep 0.5
  a=$(($a-1))
done

# for loop. syntax: for var in items; do commands; done

for fruit in apple grapes banana peach
do
  echo fruit name = $fruit
done

echo -n "Checking Connection on Port 22 for Host $1 "
while true ; do
  nc -w 1 -z $1 22 &>/dev/null
  if [ $? -eq 0 ]; then
    break
  fi
  echo -n '.'
done





