class PostsController < ApplicationController

  before_action :set_topic
  before_action :set_post, only: [:show, :edit, :update, :destroy ]

  # def index ## moved to topic show 
  #   @topic = Topic.find(params[:topic_id])
  # 	@posts = Post.all
  #   authorize @posts
  # end

  def show
    #raise
    # @topic = Topic.find(params[:topic_id]) # set_topic
  	# @post = Post.find(params[:id])  # set_post
    @comments = @post.comments
   # @comment = @post.comments.new  # this will show an extra nil comment on the post show page
    authorize @post
  end

  def new
    # @topic = Topic.find(params[:topic_id]) # set_topic
    @post = Post.new
    authorize @post
  end

  def create
    # @topic = Topic.find(params[:topic_id]) # set_topic 
    # @post = Post.new(params.require(:post).permit(:title, :body))
    # @post.topic = @topic 
    # @post.user = current_user
    # @post = @topic.posts.new(params.require(:post).permit(:title, :body))
    @post = @topic.posts.new(post_params)
    @post.user = current_user
    authorize @post
  #  byebug
    if @post.save  # the @post.save!  will stop the app; use for troubleshooting only  
      @post.create_vote
      flash[:notice] = "Your post was saved successfully!"
    #  redirect_to topic_post_path(@topic, @post)  # OK
      redirect_to [@topic, @post]  # space is needed
    else
      flash[:error] = "There was an error saving your post. Please try again."
      render :new
    end
  end

  def edit
    # @topic = Topic.find(params[:topic_id]) # set_topic
    # @post = Post.find(params[:id])  # set_post
    authorize @post
  end

  def update
    # @topic = Topic.find(params[:topic_id]) # set_topic
    # @post = Post.find(params[:id])  # set_post
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

  def destroy
    # @topic = Topic.find(params[:topic_id]) # set_topic   # set_post
    # @post = Post.find(params[:id])   # set_post
    authorize @post 
    if @post.destroy 
      flash[:notice] = "Your post \"#{@post.title}\" is deleted."
      redirect_to @topic 
    else
      flash[:error] = "There is an error deleting your post. Please try again."
      render :show 
    end
  end

private

  def set_topic 
     @topic = Topic.find(params[:topic_id])   
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def set_post
     @post = Post.find(params[:id])   
  end

end




