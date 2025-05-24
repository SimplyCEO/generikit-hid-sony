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

cp -r ../${DRIVER_DIRECTORY} /usr/src/${DRIVER_NAME}-${DRIVER_VERSION}

dkms add -m ${DRIVER_NAME} -v ${DRIVER_VERSION}
dkms build -m ${DRIVER_NAME} -v ${DRIVER_VERSION}
dkms install -m ${DRIVER_NAME} -v ${DRIVER_VERSION}
RESULT=$?

if [ "${RESULT}" != "0" ]; then
  printf "An error has occured while trying to install the driver.\n" 2>&1
else
  printf "Driver succesfully installed.\n"
fi

exit ${RESULT}

