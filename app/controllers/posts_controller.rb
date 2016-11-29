class PostsController < ApplicationController

  def index
#    @posts = Post.visible_to(current_user).where('posts.created_at > ?', 7.days.ago).paginate(:page => params[:page], per_page: 5)
    @posts = Post.visible_to(current_user).where('posts.created_at > ?', 7.days.ago).paginate(:page => params[:page], per_page: 5)
  	#raise
  end

end

