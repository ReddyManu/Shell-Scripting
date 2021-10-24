#!/bin/bash

read -p "Enter Username:" username

if [ "$username" == "root" ]
then
  echo "Hey, you are root user"
fi