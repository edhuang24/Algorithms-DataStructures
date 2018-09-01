#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run this script with root privileges'
  exit 1
fi

# Get the username (login).
read -p 'What username would you like to use? ' USER_NAME

# Get the real name (contents for the description field).
read -p 'What is your real name? ' REAL_NAME

# Get the password.
read -p 'What would you like your password to be? ' PASSWORD

# Create the user with the password.
useradd -c "${REAL_NAME}" -m "${USER_NAME}"

# Check to see if the useradd command succeeded.
if [[ ${?} -ne 0 ]]
then
  echo 'The account could not be created.'
  exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo 'The password was not set for the account'
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo "Username: ${USER_NAME}, Password: ${PASSWORD}, Host: ${HOSTNAME}"
