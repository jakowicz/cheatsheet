function gash() {
  sj_gash_print_title Retrieve key
  sj_gash_print_body "gpg --receive-keys simon@jakowicz.com"

  sj_gash_print_title "Encrypt using my private key"
  sj_gash_print_body "gpg -e -r simon@jakowicz.com -o/n"

  sj_gash_print_title "Decrypt symmetric or asymmetric"
  sj_gash_print_body "gpg -d -o"

  sj_gash_print_title "Symmetric Encryption"
  sj_gash_print_body "gpg --symmetric"
}
