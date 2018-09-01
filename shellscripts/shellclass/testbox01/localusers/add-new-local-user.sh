#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} != 0 ]]
then
  echo "Please login with root privileges"
  exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ ${#} < 1 ]]
then
  echo "Please supply at least one argument"
  exit 1
fi

# The first parameter is the user name.
USER_NAME=${1}

# The rest of the parameters are for the account comments.
shift
COMMENT=${@}

# Generate a password.
PASSWORD=$(date +%s | head -c 5)

# Create the user with the password.
useradd -c ${COMMENT} -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [[ ${?} != 0 ]]
then
  "the previous command did not work"
  exit 1
fi

# Set the password.
echo #{PASSWORD} | passwd --stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ ${?} != 0 ]]
then
  "the previous command did not work"
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
