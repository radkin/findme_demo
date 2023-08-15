#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running functional tests =================="

echo "---- producer role suite of tests ----"
bash test/run_producer_role_tests.sh

echo "---- by library suite of tests ----"
bash test/run_by_library_tests.sh

echo "---- live data suite of tests ----"
bash test/run_live_data_tests.sh

# WHOLE THING
echo "end to end test"
ruby test/live_data/everything_test.rb
