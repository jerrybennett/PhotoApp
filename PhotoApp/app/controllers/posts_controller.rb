class PostsController < ApplicationController

  def new
    @post = Post.new
    @users = User.all
    @locations = Location.all
    @tags = Tag.all
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
    @users = User.all
  end

  def create
    @post = Post.new(post_params)
    @tag = Tag.find_or_create_by(name: params[:post][:tag])
    @post.tag_id = @tag.id 
    @location = Location.find_or_create_by(name: params[:post][:location])
    @post.location_id = @location.id
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      redirect_to 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user 
    @tag = @post.tag
    @location = @post.location
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:caption, :user_id, :tag_id, :location_id, :post_img)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
