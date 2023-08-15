# findme_demo
Find web results that are an invasion of your privacy

## Certified for the following environment
* Ruby version 3.2.2
* Ubuntu 22.04

## Up and running
```bash
rbenv install -l
rbenv install 3.x.x
ruby -v
cd findme_demo
gem install bundler
bundle install
```

## Complications
If you get an error about Gemfile.lock and versions, try this
`bundle update --bundler`

## Directions for use
* use the myPersonal.json template to create initial search criteria
* run `ruby bin/findme.rb` and wait for results

## Testing
see [TEST.md](./test/TEST.md)

## Caveats
The following are out of scope (for now):
* following google search links that are themselves searches
* gathering search results past the first page
* the end goal may very well be publishing results to a REST API which is
logical.
* certainly this could dovetail nicely with a front-end UI that displays results.
* some search engines have complex hrefs that are harder to find with nokogiri. In particular Yahoo has many layers between search results and the body.


## About findme_demo
_Author: radkin@github_
_Version: 0.0.7_
