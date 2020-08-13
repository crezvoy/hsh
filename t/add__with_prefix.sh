#! /bin/sh

sh -x bin/hsh clone -p "simple package prefix" "git/simple_package/.git" || test_fail "clone failed"

echo "new file content" > "simple package prefix/new file"

hsh add simple_package "$(pwd)/simple package prefix/new file" || test_fail "add failed"

hsh status simple_package --short
hsh status simple_package --short | grep -q "^ *A *\"new file\"$" || test_fail "file not added"
