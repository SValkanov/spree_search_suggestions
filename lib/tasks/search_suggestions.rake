namespace :search_suggestions do
  desc "Generate search suggestions from products"
  task index: :environment do
    Spree::SearchSuggestion.index_products
  end
end
