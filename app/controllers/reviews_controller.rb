class ReviewsController < ApplicationController
  # GET /restaurants/:restaurant_id/reviews/new
  def new
    # render a form
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    # params == { "review"=>{"content"=>"it was awesome :-)"}, "restaurant_id"=>1  }

    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    @review.save

    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
