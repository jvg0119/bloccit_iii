class SummariesController < ApplicationController

  def show
  	#raise
  	@post = Post.find(params[:post_id])
  	@summary = @post.summary 
  end

  def new
  #	raise
  	@post = Post.find(params[:post_id])
  	@summary = Summary.new
  	authorize @summary
  end

  def create
  #	raise
  	@post = Post.find(params[:post_id])
  	@summary = Summary.new(params.require(:summary).permit(:body)) 
  	@summary.post = @post
  	@topic = @post.topic  
 # 	byebug
  #	raise
  	authorize @summary
  	if @summary.save! 
  		flash[:notice] = "Your summary is saved."
  		redirect_to topic_post_path(@topic, @post)
  	else
  		flash[:error] = "There was an error saving your summary. Please try again."
  		render :new
  	end
  end


end

