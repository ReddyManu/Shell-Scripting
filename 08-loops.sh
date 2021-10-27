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

