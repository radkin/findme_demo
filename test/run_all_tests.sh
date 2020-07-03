#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running unit tests =================="

echo "---- search_test ----"
jruby test/search_test.rb

echo "---- search_parse_all_engines_test ----"
jruby test/search_parse_all_engines_test.rb

echo "---- producer role suite of tests ----"
bash test/run_producer_role_tests.sh

echo "---- threaded_test ----"
jruby test/thread_search_engines_rest_test.rb

echo "end to end test"
jruby test/everything_test.rb
