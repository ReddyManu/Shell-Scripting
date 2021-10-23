#!/bin/bash

function abc() {
  echo My name is Reddy
  echo Value of a = "$a"
  b=200
}

xyz () {
  echo My weight is 74.2 kgs
}

abc
a=100
xyz
echo Value of b = $b


