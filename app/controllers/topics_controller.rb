class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update]

  def index
  	@topics = Topic.all
    authorize @topics  	
  end

  def show
  	#@topic = Topic.find(params[:id])
  	@posts = @topic.posts
	authorize @topic  	
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

private

  def set_topic
    @topic = Topic.find(params[:id])    
  end

  def topic_params
  	params.require(:topic).permit(:name, :public, :description)
  end

end
