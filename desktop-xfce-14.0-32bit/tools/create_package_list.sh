#!/bin/sh
#
CWD=$(pwd)
ls $CWD/../../desktop-xfce-14.0-source \
  > /tmp/all.txt
cat /tmp/all.txt \
  | grep -v all.SlackBuild \
  > $CWD/pkglists/packages-desktop-xfce
