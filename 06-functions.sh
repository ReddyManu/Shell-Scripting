#!/bin/bash

function abc() {
  echo My name is Reddy
  a=10
  echo Value of a in function = $a
  b=200
  return 20
  echo First Argument in Function = $1
}

xyz () {
  echo My weight is 74.2 kgs
}

a=100
#abc Rahul
abc $1
echo Exit status of abc - $?
echo Value of b in main program = $b
xyz
echo First Argument in Main Program = $1


