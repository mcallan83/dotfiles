# fancy diff
function fdiff {
    diff -u "$@" | diff-so-fancy
}
