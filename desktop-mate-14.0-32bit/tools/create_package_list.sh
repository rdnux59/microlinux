#!/bin/sh
#
CWD=$(pwd)
ls $CWD/../../desktop-mate-14.0-source \
  > /tmp/all.txt
cat $CWD/pkglists/msb \
  > $CWD/pkglists/packages-desktop-mate
cat /tmp/all.txt \
  | grep -v all.SlackBuild \
  >> $CWD/pkglists/packages-desktop-mate
