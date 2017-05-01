class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking

  def ranking
    @ranking = Product.order('id ASC').limit(5)
  end
end
