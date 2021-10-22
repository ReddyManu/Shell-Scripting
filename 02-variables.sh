#!/bin/bash


a=100
b=abc

echo Value of a = $a
echo Value of b = $b

x=10
y=20

echo ${x}X${y} = 200

echo Welcome, todays date is 2021-10-20

DATE=$(date +%F)
echo Hello, todays date is $DATE

ADD=$((4+5+6+5+7*7/2-5))

echo Calculation value = $ADD
