class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "Your Review was successfully submitted!"
      redirect_to reviews_path
    else
      render :new
    end
  end

  # def index
  #   @reviews = Review.all
  # end

  def testimonials
    @reviews = Review.where(approved: true)
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :rating, :content)
  end
end
