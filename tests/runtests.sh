#!/bin/sh

for test_script in tests/test_*.sh; do
    shunit2 $test_script
done
