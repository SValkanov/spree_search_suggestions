class Spree::SearchSuggestion
  def self.terms_for prefix
    Redis.current.zrevrange "search-suggestions:#{prefix.mb_chars.downcase.to_s}", 0, 9
  end

  def self.index_products
    Spree::Product.find_each do |product|
      index_term(product.name)
      product.name.split.each { |t| index_term(t) }
    end
  end

  def self.index_term term
    1.upto(term.length-1) do |n|
      prefix = term[0, n]
      Redis.current.zincrby "search-suggestions:#{prefix.mb_chars.downcase.to_s}", 1, term.mb_chars.downcase.to_s
    end
  end

  def self.remove_index_term term
    1.upto(term.length-1) do |n|
      prefix = term[0, n]
      Redis.current.zrem "search-suggestions:#{prefix.mb_chars.downcase.to_s}", term.mb_chars.downcase.to_s
    end
  end
end
