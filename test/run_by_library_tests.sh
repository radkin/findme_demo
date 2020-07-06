#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running unit tests =================="

echo "---- By Library unit test suite ----"

echo "google"
jruby test/by_library/google_parser_test.rb

echo "bing"
jruby test/by_library/bing_parser_test.rb

echo "startpage"
jruby test/by_library/startpage_parser_test.rb
