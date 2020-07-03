#!/usr/bin/env bash

echo "NOTE: this scipt is designed for you to run it from the root dir"
echo "Example: cd findme_demo; test/run_all_tests.sh"

echo "================== checking code quality =================="

echo "running rubocop standalone linter"
bundle exec rubocop

echo "speed optimization suggestsions from fasterer"
bundle exec fasterer

echo "code smells from reek"
bundle exec reek .

echo "generate code coverage html"
bundle exec deep-cover clone command to run test
