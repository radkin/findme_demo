#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running functional tests =================="

echo "---- search_test ----"
jruby test/live_data/search_test.rb

echo "---- search_parse_all_engines_test ----"
jruby test/live_data/search_parse_all_engines_test.rb

echo "---- producer role suite of tests ----"
bash test/live_data/run_producer_role_tests.sh

echo "---- threaded_test ----"
jruby test/live_data/thread_search_engines_rest_test.rb

echo "end to end test"
jruby test/live_data/everything_test.rb
