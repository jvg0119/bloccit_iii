class VotesController < ApplicationController

  def up_vote
  	update_vote(1)  	
  	# @post = Post.find(params[:post_id])
  	# if @vote = @post.votes.where(user: current_user).first
  	# 	@vote.update_attributes(value: 1, user: current_user, post: @post)
  	# else
  	# 	@post.votes.create(value: 1, user: current_user)
  	# end
  	# redirect_to :back
  end

  def down_vote
  	update_vote(-1)
  	# @post = Post.find(params[:post_id])
  	# if @vote = @post.votes.where(user: current_user).first
  	# 	@vote.update_attributes(value: -1, user: current_user, post: @post)
  	# else
  	# 	@post.votes.create(value: -1, user: current_user)
  	# end
  	# redirect_to :back
  end

private

  def update_vote!(new_value)
  	@post = Post.find(params[:post_id])
  	if @vote = @post.votes.where(user: current_user).first
  		@vote.update_attributes(value: new_value)#, user: current_user, post: @post)
  	else
  		@post.votes.create(value: new_value, user: current_user)
  	end
  	redirect_to :back  	
  end


end



