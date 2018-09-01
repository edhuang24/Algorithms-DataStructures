#!/bin/bash

echo "Your UID is ${UID}"

USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

if [[ "${UID}" -eq 0 ]]
then
  echo "You are the root."
else
  echo "You are not the root."
fi
