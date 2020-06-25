# findme_demo
Find web results that are an invasion of your privacy

## Certified for the following environment
* Ruby version 2.6.6
* Ubuntu 18.04

## Up and running
```bash
ruby -v
cd findme_demo
bundle install
```
## Directions for use
* use the myPersonal.json template to create initial search criteria
* run findme.rb and wait for results

## Testing
while in the root directory run

```bash
ruby test/findme_search_test.rb
ruby test/findme_parse_test.rb
```

* **search test**: query construction, reading user provided json file, confirm
expected search engine APIs work as expected
* **parse test**: are we getting a list of links that work? Are they something
valid that we can use right now?

## Caveats


## About findme_demo
_Author: radkin@github_
_Version: 0.0.2_
