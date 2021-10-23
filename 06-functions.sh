#!/bin/bash

function abc() {
  echo My name is Reddy
  a=10
  echo Value of a in function = $a
  b=200
  echo First Argument in Function = $1
  return 20
}

xyz () {
  echo My weight is 74.2 kgs
}

a=100
#abc Rahul
abc $1
xyz
b=20
echo Value of b in main program = $b
echo The exit status of abc is - $?
echo First Argument in Main Program = $1


