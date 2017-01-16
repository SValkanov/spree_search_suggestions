Spree Search Suggestions
======================

Spree gem - Search suggestions based on Redis.

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_search_suggestions', github: 'SValkanov/spree_search_suggestions', branch: '3-1-stable'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Setup the gem OR setup your Redis config file
  ```ruby
  bundle exec rails g spree_search_suggestions:install
  ```

  OR setup your /config/initializers/redis.rb file
  ```ruby
  Redis.current = Redis.new(host: 'localhost', port: 6379, db: 1)
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

5. You will need running Redis

6. Be sure to index all current products before usage

## Examples

1. Index all current products (rails c)
  ```ruby
  Spree::SearchSuggestion.index_products
  ```

2. Index certain string
  ```ruby
  Spree::SearchSuggestion.index_term "string"
  ```

3. Remove certain string from your indexes
  ```ruby
  Spree::SearchSuggestion.remove_index_term "string"
  ```

4. Clear redis database
  ```ruby
  Redis.current.flushall
  ```

Copyright (c) 2017 Stanislav Valkanov released under the New BSD License
