class ReviewsController < RankingController
  def new
    # binding.pry
    @product = Product.find(params[:product_id])
    @review = Review.new()
  end
end
