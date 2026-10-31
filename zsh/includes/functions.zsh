# search aliases
als() {
  alias | grep -F -- "$1"
}

# copy file with appended .bak extension
bak() {
  cp "$1" "$1.bak"
}
