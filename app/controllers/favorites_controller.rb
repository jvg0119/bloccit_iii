class FavoritesController < ApplicationController

  def create
  	# create a favorite w/ all it's associations
  	post = Post.find(params[:post_id])
  	favorite = post.favorites.new(user: current_user)
  	authorize favorite
  	if favorite.save
	  	flash[:notice] = "Favorited post."
	  	redirect_to [post.topic, post]	
	  	#redirect_back fallback_location: root_path # OK
	  	#raise
	  else
	  	flash[:error] = "Error favoriting. Please try again."
	  	redirect_back fallback_location: root_path
	  end
  end

  def destroy
  	post = Post.find(params[:post_id])
  	favorite = Favorite.find(params[:id])
  	authorize favorite
  	if favorite.destroy
  		flash[:notice] = "You have unfavorited this post."
  		redirect_back fallback_location: root_path
  		# redirect_to [post.topic, post]	# OK
  	else
  		flash[:error] = "Error deleting post. Please try again."
  		redirect_back fallback_location: root_path
  	end
  end

end
