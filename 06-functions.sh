#!/bin/bash

function abc() {
  echo My name is Reddy
  a=10
  echo Value of a = $a
  b=200
  echo First Argument in Function = $1
}

xyz () {
  echo My weight is 74.2 kgs
}

a=100
abc Rahul
xyz
b=20
echo Value of b = $b
echo First Argument in Main Program = $1
