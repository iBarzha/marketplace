class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_watch

  def create
    @review = @watch.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @watch, notice: 'Review was successfully created.'
    else
      render 'watchs/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @watch, notice: 'Review was successfully destroyed.'
  end

  private

  def set_watch
    @watch = Watch.find(params[:watch_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
