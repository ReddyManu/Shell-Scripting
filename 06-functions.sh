#!/bin/bash

function abc() {
  echo My name is Reddy
  a=10
  echo Value of a in function = $a
  b=200
  echo First Argument in Function = $1
  return 30
}

xyz () {
  echo My weight is 74.2 kgs
}

a=100
#abc Rahul
abc $1
echo Value of b in main program = $b
echo Exit status of abc - $?
xyz
echo First Argument in Main Program = $1


