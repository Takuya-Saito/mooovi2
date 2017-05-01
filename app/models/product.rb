class Product < ActiveRecord::Base
  has_many :reviews

  def reviews_average
    self.reviews.average(:rate).round
  end
end
