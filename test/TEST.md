# Findme_demo tests

There are three testing suites: by_library, producer_role, and live data.

**unit tests by_library**
```bash
jruby test/by_library/bing_parser_test.rb
jruby test/by_library/google_parser_test.rb
jruby test/by_library/startpage_parser_test.rb
jruby test/by_library/common_test.rb
```

**unit tests for the producer_role**
```bash
jruby test/producer_role/bing_test.rb
jruby test/producer_role/google_test.rb
jruby test/producer_role/startpage_parser_test.rb
```

**functional tests on live data**
Here we can more easily find edge cases:

```bash
jruby test/live_data/search_test.rb
jruby test/live_data/search_parse_all_engines_test.rb
jruby test/live_data/threaded_test_search_engines_rest.rb

jruby test/live_data/everything_test.rb
```

* **search test**: query construction, reading user provided json file, confirm
expected search engine APIs work as expected
* **search parse all engines test**:
  - are we getting a list of links that work?
  - Are they something valid that we can use right now?
  - Are we getting both direct and search query links?
* **thread search engines rest test**: basic implementation of threaded rest client
  - GET search query result
  - parse query result
* **everything test**: end to end test

## Linting, code smells and code metrics
`test/run_all_tests.sh`
all tools presently in use are listed in this file. You can view output
interactively for everything.

### Cyclomatic Complexity (check methods)
[RuboCop::Cop::Metrics::CyclomaticComplexity](https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Metrics/CyclomaticComplexity)

### Assignments, Branches and Conditions metrics (cognitive size)
[RuboCop::Cop::Metrics::AbcSize](https://www.rubydoc.info/gems/rubocop/0.27.0/RuboCop/Cop/Metrics/AbcSize)
