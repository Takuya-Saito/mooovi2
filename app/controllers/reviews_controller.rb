class ReviewsController < RankingController
  before_action :authenticate_user!, only: :new
  def new
    # binding.pry
    @product = Product.find(params[:product_id])
    @review = Review.new()
  end

  def create
    # binding.pry
    review = Review.new(review_params)
    review.save
    # redirect_to :root
    # redirect_to root_path
    redirect_to controller: :products, action: :index
  end

  private
  def review_params
    params.require(:review).permit(:nickname, :rate, :review).merge(product_id: params[:product_id])
  end


end
