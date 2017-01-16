class Spree::SearchSuggestionsController < ApplicationController
  def index
    render json: Spree::SearchSuggestion.terms_for(params[:term])
  end
end
