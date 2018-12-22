function gash() {
  sj_gash_print_title "Start HTTP server Python 2"
  printsj_gash_print_body2 "python -m SimpleHTTPServer 8000"

  sj_gash_print_title "Start HTTP server Python 3"
  sj_gash_print_body "python -m http.server 3000"
}
