#!/bin/sh
#
CWD=$(pwd)
ls $CWD/../../desktop-base-14.1-source \
  > /tmp/all.txt
cat /tmp/all.txt \
  | grep -v all.SlackBuild \
  | grep -v build_order \
  | grep -v openoffice-langpack \
  | grep -v filezilla \
  | grep -v virtualbox \
  | grep -v broadcom-sta \
  > $CWD/pkglists/packages-desktop-base
