#!/bin/bash
# Displays workflow instructions

shopt -s nocasematch

echo
if [ "$1" = "-h" ] || [ "$1" = "-help" ]; then
  echo "Usage:   bash ${0} [Step number: all] [steps]"
  echo "Example: ${0} 4      Prints instructions for Step 4"
  echo "Example: ${0}        Prints all instructions"
  echo "Example: ${0} steps  Prints list of steps"
  exit 1
fi

if [ "$1" = "step" ] || [ "$1" = "steps" ]; then
  cat tutorial.txt | grep -i  "\bStep\b"
  exit 1
fi

if [[ "$1" == *"."* ]]; then
  END_PATTERN="________"
else
  END_PATTERN="--------"
fi


DIR=$(dirname "${BASH_SOURCE[0]}")

if [ -z "$1" ]; then
   cat $DIR/tutorial.txt
else
   cat $DIR/tutorial.txt | sed -ne "/Step $1/I, /${END_PATTERN}/{p;}"
fi


