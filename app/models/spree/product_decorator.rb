module Spree
  Spree::Product.class_eval do
    after_save :index_name, if: :name_changed?
    before_update :remove_index_name, if: :name_changed?
    after_destroy :remove_index_name

    private

    def index_name
      Spree::SearchSuggestion.index_term self.name
    end

    def remove_index_name
      Spree::SearchSuggestion.remove_index_term self.name_was
    end
  end
end
