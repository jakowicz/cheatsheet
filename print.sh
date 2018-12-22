
SJG_RED="\033[0;31m"
SJG_YELLOW='\033[1;33m'
SJG_NC='\033[0m'

function sj_gash_print_title() {
  printf "$SJG_YELLOW $1\n"
}

function sj_gash_print_body() {
  printf "$SJG_NC $1\n\n"
}
