# findme_demo
Find web results that are an invasion of your privacy

## Certified for the following environment
* JRuby version 9.2.11.1
* Ubuntu 18.04

## Up and running
```bash
rbenv install -l
rbenv install jruby-X.X.X.X
jruby -v
cd findme_demo
gem install bundler
bundle install
```

## Complications
If you get an error about Gemfile.lock and versions, try this
`bundle update --bundler`

## Directions for use
* use the myPersonal.json template to create initial search criteria
* run `jruby bin/findme.rb` and wait for results

## Testing
while in the root directory run

```bash
jruby test/findme_search_test.rb
jruby test/findme_parse_test.rb
jruby test/findme_threaded_test.rb
```

* **search test**: query construction, reading user provided json file, confirm
expected search engine APIs work as expected
* **parse test**: are we getting a list of links that work? Are they something
valid that we can use right now?
* **threaded test**: basic implementation of threaded rest client GET of all
google recommended search queries returned from our initial query

## Linting, code smells and code metrics
`test/run_all_tests.sh`
all tools presently in use are listed in this file. You can view output
interactively for everything.

### Cyclomatic Complexity (check methods)
[RuboCop::Cop::Metrics::CyclomaticComplexity](https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Metrics/CyclomaticComplexity)

### Assignments, Branches and Conditions metrics (cognitive size)
[RuboCop::Cop::Metrics::AbcSize](https://www.rubydoc.info/gems/rubocop/0.27.0/RuboCop/Cop/Metrics/AbcSize)

## Code coverage HTML report
Point your browser at `findme_demo/coverage/index.html`

## Caveats
The following are out of scope (for now):
* following google search links that are themselves searches
* gathering search results past the first page
* the end goal may very well be publishing results to a REST API which is
logical.
* certainly this could dovetail nicely with a front-end UI that displays results.


## About findme_demo
_Author: radkin@github_
_Version: 0.0.4_
