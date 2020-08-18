#! /bin/sh

hsh clone "git/package_dep_prefix/.git" || test_fail "clone failed"

[ -e "file_dep_prefix" ] || test_fail "simple_file not checked out"
[ -e "subdir_dep_prefix/subfile_dep_prefix" ] || test_fail "simple_subfile not checked out"

[ -e "dep/prefix/simple_file3" ] || test_fail "simple_file3 not checked out"
[ -e "dep/prefix/simple_subdir3/simple_subfile3" ] || test_fail "simple_subfile3 not checked out"
