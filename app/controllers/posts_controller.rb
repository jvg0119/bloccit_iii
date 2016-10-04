class PostsController < ApplicationController

  before_action :set_post

  # def index
  #   @topic = Topic.find(params[:topic_id])
  # 	@posts = Post.all
  #   authorize @posts
  # end

  def show
    #raise
    # @topic = Topic.find(params[:topic_id]) # set_post
  	@post = Post.find(params[:id])
    authorize @post
  end

  def new
    # @topic = Topic.find(params[:topic_id]) # set_post
    @post = Post.new
    authorize @post
  end

  def create    
    # @topic = Topic.find(params[:topic_id]) # set_post 
 #   @post = Post.new(params.require(:post).permit(:title, :body))
 #   @post.topic = @topic 
 #   @post.user = current_user
    # @post = @topic.posts.new(params.require(:post).permit(:title, :body))
    @post = @topic.posts.new(post_params)
    @post.user = current_user
    authorize @post
  #  byebug
    if @post.save!   
      flash[:notice] = "Your post was saved successfully!"
    #  redirect_to topic_post_path(@topic, @post)  # OK
      redirect_to [@topic, @post]  # space is needed
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    #raise
    # @topic = Topic.find(params[:topic_id]) # set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    #raise
    # @topic = Topic.find(params[:topic_id]) # set_post
    @post = Post.find(params[:id])
    authorize @post 
    # if @post.update_attributes(params.require(:post).permit(:title, :body))
    if @post.update_attributes(post_params)
      flash[:notice] = "Your post was updated successfully!"
      redirect_to [@topic, @post] 
    else
      flash[:notice] = "There was an error updating your post. Please try again."
      render :edit
    end
  end

private

  def set_post 
     @topic = Topic.find(params[:topic_id])   
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end




