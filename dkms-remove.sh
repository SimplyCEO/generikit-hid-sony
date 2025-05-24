#!/bin/sh

if [ $EUID -ne 0 ]; then
  printf "You must run this with root privileges.\n" 2>&1
  exit 1
else
  printf "Running dkms install...\n"
fi

DRIVER_DIRECTORY=generikit-hid-sony
DRIVER_NAME=generikit-hid-sony
DRIVER_VERSION=0.2.0

dkms remove ${DRIVER_NAME}/${DRIVER_VERSION} --all
rm -rfv /usr/src/${DRIVER_NAME}-${DRIVER_VERSION}
RESULT=$?

if [ "${RESULT}" != "0" ]; then
  printf "An error has occured while trying to remove the driver.\n" 2>&1
else
  printf "Driver succesfully uninstalled.\n"
fi

exit ${RESULT}

