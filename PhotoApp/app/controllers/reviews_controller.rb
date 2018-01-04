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
    @post = Post.find(params[:post_id])
    @review.post_id = @post.id
    @user = User.find(review_params[:user_id])
    @review.user_id = @user.id
    if @review.valid?
      @review.save
      redirect_to post_path(@post) 
    else
      redirect_to post_path(@post)
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
      params.require(:review).permit(:like, :comment, :user_id)
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
