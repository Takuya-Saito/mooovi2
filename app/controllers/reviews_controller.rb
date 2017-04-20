class ReviewsController < RankingController
  def new
    # binding.pry
    @product = Product.find(params[:product_id])
    @review = Review.new()
  end

  def create
    binding.pry
    review = Review.new(review_params)
    review.save
  end

  private
  def review_params
    params.require(:review).permit(:nickname, :rate, :review).merge(product_id: params[:product_id])
  end


end
