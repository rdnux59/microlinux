#!/bin/sh
#
CWD=$(pwd)
ls $CWD/../../desktop-xfce-14.1-source \
  > /tmp/all.txt
cat /tmp/all.txt \
  | grep -v all.SlackBuild \
  | grep -v build_order \
  > $CWD/pkglists/packages-desktop-xfce
