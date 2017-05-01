class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking

  def ranking
    @ranking = Product.order('id ASC').limit(5)
    ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    @ranking = ids.map{|id| Product.find(id)}
  end
end
