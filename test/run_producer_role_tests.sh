#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running unit tests =================="

echo "---- Producer role unit test suite ----"

echo "google"
jruby test/producer_role/google_test.rb

echo "bing"
jruby test/producer_role/bing_test.rb

echo "startpage"
jruby test/producer_role/startpage_test.rb
