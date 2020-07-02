#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== running unit tests =================="

echo "---- search_test ----"
jruby test/search_test.rb

echo "---- search_parse_all_engines_test ----"
jruby test/search_parse_all_engines_test.rb

echo "---- threaded_test ----"
jruby test/thread_test_search_engines_rest.rb

echo "end to end test"
jruby test/everything_test.rb

echo "running rubocop standalone linter"
bundle exec rubocop

echo "speed optimization suggestsions from fasterer"
bundle exec fasterer

echo "code smells from reek"
bundle exec reek .

echo "generate code coverage html"
bundle exec deep-cover clone command to run test
