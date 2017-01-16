module SpreeSearchSuggestions
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_search_suggestions\n"
        #append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_search_suggestions\n"
      end

      def add_stylesheets
        ##inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_search_suggestions\n", :before => /\*\//, :verbose => true
        #inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_search_suggestions\n", :before => /\*\//, :verbose => true
      end

      def create_redis_initializer_file
        create_file "config/initializers/redis.rb", "Redis.current = Redis.new(host: 'localhost', port: 6379, db: 1)"
      end
    end
  end
end
