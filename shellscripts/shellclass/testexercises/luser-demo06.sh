#!/bin/bash

# This script generates a random password for each user specified on the comand line.

# Display what the user typed on the command line.
echo "You executed this command: ${0}"

# Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to $(basename ${0}) script."

# Tell them how many arguments they passed in.
# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS=${#}
echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) to the command line"

# Make sure they at least supply one argument.
if [[ NUMBER_OF_PARAMETERS < 1 ]]
then
  echo "You need to supply at least one argument"
  exit 1
fi

# Generate and display a password for each parameter.
for USER_NAME in ${@}
do
  PASSWORD=$(date +%s | head -c5)
  echo "${USER_NAME}: ${PASSWORD}"
done