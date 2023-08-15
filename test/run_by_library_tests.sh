#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running unit tests =================="

echo "---- By Library unit test suite ----"

echo "google"
ruby test/by_library/google_parser_test.rb

echo "bing"
ruby test/by_library/bing_parser_test.rb

echo "startpage"
ruby test/by_library/startpage_parser_test.rb

echo "common test"
ruby test/by_library/common_test.rb
