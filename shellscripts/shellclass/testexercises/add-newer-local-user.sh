#!/bin/bash
#

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" != 0 ]]
then
  echo "Please use superuser privileges" >&2
  exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" < 1 ]]
then
  echo "You must supply at least one argument" >&2
  exit 1
fi

# The first parameter is the user name.
USER_NAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENTS="${@}"

# Generate a password.
PASSWORD=`date +%s | head -c5`

# Create the user with the password.
useradd -c "${COMMENTS}" -m "${USER_NAME}" &> /dev/null

# Check to see if the useradd command succeeded.
if [[ "${?}" != 0 ]]
then
  echo "Your command did not succeed, please try again" >&2
  exit 1
fi

# Set the password.
echo PASSWORD | passwd -stdin ${USER_NAME} &> /dev/null

# Check to see if the passwd command succeeded.
if [[ "${?}" != 0 ]]
then
  echo "Your command did not succeed, please try again" >&2
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME} &> /dev/null

# Display the username, password, and the host where the user was created.
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
