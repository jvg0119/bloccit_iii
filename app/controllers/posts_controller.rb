class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

   def new
     @post = Post.new
   end

   def create
    # raise
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    if @post.save 
      flash[:notice] = "Your post was saved successfully!"
      redirect_to post_path(@post)
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
   end

  def edit
  end
end
