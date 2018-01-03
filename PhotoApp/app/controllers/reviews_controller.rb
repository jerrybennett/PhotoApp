class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @post = Post.find(params[:post_id])
    @review.post_id = @post.id
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.post_id = @post.id
    if @review.valid?
      @review.save
      redirect_to review_path(@review) 
    else
      redirect_to review_path(@review)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:like, :comment, :user_id, :post_id)
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
