#!/bin/sh
#
# trim_desktop_mate.sh
#
# This script prepares the system before building the Microlinux Enterprise
# Desktop MATE. It removes unneeded packages and installs needed ones. You might run
# 'slackpkg update' before calling it.
#

CWD=$(pwd)

CRUFT=$(egrep -v '(^\#)|(^\s+$)' $CWD/pkglists/desktop-mate-remove)
INSTALL=$(egrep -v '(^\#)|(^\s+$)' $CWD/pkglists/desktop-mate-add)

for PACKAGE in $CRUFT; do
  if [ -r /var/log/packages/${PACKAGE}-[0-9]* ] ; then
    /sbin/removepkg ${PACKAGE} 
  fi
done

unset PACKAGES

for PACKAGE in $INSTALL; do
  if [ ! -r /var/log/packages/${PACKAGE}-[0-9]* ] ; then
    PACKAGES="$PACKAGES $PACKAGE"
  fi
done

if [ -z "$PACKAGES" ]; then
  continue
else
  /usr/sbin/slackpkg install $PACKAGES
fi

echo
echo ":: System is ready for building the Microlinux Enterprise Desktop MATE."
echo
