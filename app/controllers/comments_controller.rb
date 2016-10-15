class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
   # raise
   # @topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id]) # this is already connected to topic
	  @comment = @post.comments.new(comment_params) 
    @comment.user = current_user  
    authorize @comment
    if @comment.save
      flash[:notice] = "Your comment was successfully created!"
      redirect_to topic_post_path(@post.topic, @post)
    else 
      flash[:error] = "There is an error saving your comment. Please try again."
      redirect_to topic_post_path(@post.topic, @post)
    end 
  end

  def destroy   
    #@post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]) # already connected to post
    authorize @comment 
   # raise
    if @comment.destroy
      flash[:notice] = "Your comment is now deleted."
      redirect_to  topic_post_path(@comment.post.topic, @comment.post)
    else
      flash[:error] = "There was an error deleting your comment. Please try again."
      redirect_to  topic_post_path(@comment.post.topic, @comment.post)
    end
  end

private

  def comment_params
  	params.require(:comment).permit(:body)
  end

end
