#! /bin/bash

hsh init -p prefix "test" || test_fail "init command failed"

[ -d ".hsh/repos/test/objects" ] || test_fail "package not initialized"
[ -d "prefix" ] || test_fail "repository prefix not created"
