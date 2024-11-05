#!/bin/bash
# check whether the script is running as a root user or not

USER_UID=$(id -u)
echo "$USER_UID"
if [ ${USER_UID} -ne 0 ]; then
  echo -e "\e[1;31mYou must be a root user to perform this script\e[0m"
  exit
  fi

  COMPONENT=$1

  if [ -z "$COMPONENT" ]; then
    echo -e "\e[1;31mComponent Argument, check Input is missing\e[0m"
    exit
    fi

    if [ ! -e components/${COMPONENT}.sh ]; then
      echo -e "\e[1;31mComponent script doesnot exists\e[0m"
      exit
      fi

      bash components/${COMPONENT}.sh