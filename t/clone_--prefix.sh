#! /bin/sh

hsh clone -p "simple/package/prefix" "git/simple_package/.git" || test_fail "clone failed"

[ -e "simple/package/prefix/simple_file" ] || test_fail "simple_file not checked out"
[ -e "simple/package/prefix/simple_subdir/simple_subfile" ] || test_fail "simple_subfile not checked out"
