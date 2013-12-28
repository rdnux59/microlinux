#!/bin/sh
#
# Copyright (c) 2013 Niki Kovacs <info@microlinux.fr>
# -----------------------------------------------------------------------------
#
# This script parses the packages-desktop-kde file in the pkglists directory and
# installs all listed packages using slackpkg. 
#
# The slackpkg+ plugin has to be installed and the server repository configured.
#

CWD=$(pwd)

INSTALL=$(egrep -v '(^\#)|(^\s+$)' $CWD/pkglists/packages-desktop-kde)

unset PACKAGES

for PACKAGE in $INSTALL; do
  if [ ! -r /var/log/packages/${PACKAGE}-[r,0-9]* ] ; then
    PACKAGES="$PACKAGES $PACKAGE"
  fi
done

if [ -z "$PACKAGES" ]; then
  continue
else
  /usr/sbin/slackpkg install $PACKAGES
fi

echo
echo ":: Microlinux Enterprise Desktop KDE installed."
echo
