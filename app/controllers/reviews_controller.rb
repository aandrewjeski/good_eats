class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    if @review.save
      flash[:notice] = "Success!"
      redirect_to "/restaurants"
    else
      flash.now[:notice] = "Your review couldn't be saved."
      render '/restaurants/:restaurant_id/reviews/new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
