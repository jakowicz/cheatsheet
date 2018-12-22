#!/bin/bash

SJG_RED="\033[0;31m"
SJG_YELLOW='\033[1;33m'
SJG_NC='\033[0m'
CHEATSHEET=$1

function sj_gash_print_title() {
  printf "$SJG_YELLOW $1\n"
}

function sj_gash_print_body() {
  printf "$SJG_NC $1\n\n"
}

cheatsheets="gpg python"

echo ""

if [ -z $CHEATSHEET ]; then
  printf "$SJG_RED No program provided, available options are: $cheatsheets"
else
  if [ $CHEATSHEET == "gpg" ]; then
    sj_gash_print_title Retrieve key
    sj_gash_print_body "gpg --receive-keys simon@jakowicz.com"

    sj_gash_print_title "Encrypt using my private key"
    sj_gash_print_body "gpg -e -r simon@jakowicz.com -o/n"

    sj_gash_print_title "Decrypt symmetric or asymmetric"
    sj_gash_print_body "gpg -d -o"

    sj_gash_print_title "Symmetric Encryption"
    sj_gash_print_body "gpg --symmetric"
  elif [ $CHEATSHEET == "python" ]; then
    sj_gash_print_title "Start HTTP server Python 2"
    sj_gash_print_body "python -m SimpleHTTPServer 8000"

    sj_gash_print_title "Start HTTP server Python 3"
    sj_gash_print_body "python -m http.server 3000"
  else
      printf "$SJG_RED Could not find cheatsheet for: $CHEATSHEET"
  fi
fi
