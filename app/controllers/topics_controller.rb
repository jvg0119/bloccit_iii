class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    # @topics = Topic.all
    # @topics = Topic.paginate(page: params[:page])
    # @topics = Topic.paginate(:page => params[:page], per_page: 10).visible_to(current_user)
    @topics = Topic.visible_to(current_user).paginate(:page => params[:page], per_page: 10)
    authorize @topics
  end

  def show
  	#@topic = Topic.find(params[:id])
    authorize @topic
    @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
    #authorize @topic  	
  end

  def new
  	@topic = Topic.new
  	authorize @topic  	
  end

  def create 
  	@topic = Topic.new(topic_params)
  	authorize @topic  	
  	if @topic.save
  		flash[:notice] = "Your topic was created successfully!"
  		redirect_to @topic 
  	else
  		flash[:error] = "There was an error creating your topic. Please try again."
  		render :new 
  	end
  end

  def edit
  	#@topic = Topic.find(params[:id])
  	authorize @topic  	
  end

  def update
  	#@topic = Topic.find(params[:id])
  	authorize @topic  	
  	if @topic.update_attributes(topic_params)
  		flash[:notice] = "Your topic was updated successfully!"
  		redirect_to @topic 
  	else
  		flash[:error] = "There was an error updating your topic. Please try again."
  		render :edit 
  	end  		
  end

  def destroy
    #raise
    # @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy 
      flash[:notice] = "Your topic \"#{@topic.name}\" was deleted successfully!"
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic. Please try again."
      render :show
    end
  end

private

  def set_topic
    @topic = Topic.find(params[:id])    
  end

  def topic_params
  	params.require(:topic).permit(:name, :public, :description)
  end

end
