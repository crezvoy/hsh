#! /bin/sh

mkdir prefix
hsh clone -p prefix "git/simple_package/.git" || test_fail "clone failed"

hsh dotgit simple_package || test_fail "dotgit failed"

[ -e "prefix/.git" ] || test_fail "dotgit file not created"
cd prefix
(git remote show origin | grep "git/simple_package/.git") || test_fail "malformed dotgit"

true
