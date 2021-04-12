#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"
hsh clone "git/simple_package2/.git" || test_fail "clone failed"
mkdir prefix
hsh clone -p prefix "git/simple_package3/.git" || test_fail "clone failed"

output="$(hsh ls)"

[ "$(echo "$output" | wc -l)" -eq "4" ] ||  test_fail "missing repository in listing"
(echo "$output" | grep "^hsh") || test_fail "missing repository simple_package in listing"
(echo "$output" | grep "^simple_package") || test_fail "missing repository simple_package in listing"
(echo "$output" | grep "^simple_package2") || test_fail "missing repository simple_package2 in listing"
(echo "$output" | grep "^simple_package3 \((.*) \)*-> prefix") || test_fail "missing repository simple_package3 in listing"

true
