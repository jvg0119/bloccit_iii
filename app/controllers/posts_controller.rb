class PostsController < ApplicationController
  def index
#  	@posts = Post.all
#    authorize @posts
    @posts = policy_scope(Post)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    # raise
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    authorize @post
    if @post.save 
      flash[:notice] = "Your post was saved successfully!"
      redirect_to post_path(@post)
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      authorize @post 
      flash[:notice] = "Your post was updated successfully!"
      redirect_to @post 
    else
      flash[:notice] = "There was an error updating your post. Please try again."
      render :edit
    end
  end


end




