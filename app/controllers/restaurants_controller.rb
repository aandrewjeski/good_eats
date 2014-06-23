class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order('id DESC').limit('10')
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Success!"
      redirect_to '/restaurants'
    else
      flash.now[:notice] = "Your restaurant couldn't be saved."
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
  end
end
