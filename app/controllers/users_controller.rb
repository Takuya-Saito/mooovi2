class UsersController < ApplicationController
before_action :authenticate_user!, only: :show
  def show
    @reviews = current_user.reviews.order('created_at DESC')
  end

end
