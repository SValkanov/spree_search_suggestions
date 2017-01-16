module SpreeSearchSuggestions
  class Engine < Rails::Engine
    require 'spree/core'
    require 'redis'
    require 'jquery-rails'
    isolate_namespace Spree
    engine_name 'spree_search_suggestions'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
    config.middleware.insert_before 0, "Spree::SearchSuggestions"
  end
end
