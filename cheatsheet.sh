#!/bin/bash

source print.sh

cheatsheets=()

for cheatsheet in `ls -1 gash`; do
  cheatsheets+=( `echo ${cheatsheet/.sh/}` )
done

echo ""

if [ -z $1 ]; then
  printf "$SJG_RED No program provided, available options are: %s" "${cheatsheets[*]}"
elif [ ! -f gash/$1.sh ]; then
  printf "$SJG_RED Couldn't find a cheatsheet for $1"
else
  source gash/$1.sh
  gash
fi
