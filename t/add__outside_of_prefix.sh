#! /bin/sh

sh -x bin/hsh clone -p "simple package prefix" "git/simple_package/.git" || test_fail "clone failed"

echo "new file content" > "new file"

hsh add simple_package "new file" && test_fail "add outside prefix should fail"

true
