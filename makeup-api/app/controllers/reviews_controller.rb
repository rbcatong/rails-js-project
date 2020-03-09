class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # implement code for create (POST) endpoint
  def create
    @product = Product.find_by(id: params[:product_id])

    @review = Review.new(review_params)
    @review.save

    # why isnt the review being saved
    render json: @review
  end

  def update
    @review = Review.find_by(id: params[:id])

    @review.update(review_params)
    render json: @review
  end


  private
  def review_params
    params.permit(:title,:content,:rating,:product_id)
  end
  # why isnt category populated
  # are we getting the product id for this review
end
