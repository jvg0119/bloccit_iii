class VotesController < ApplicationController

  def up_vote
  	# @post = Post.find(params[:post_id])
  	# if @post.votes.any? && Vote.last.user == current_user
  	# 	@post.votes.last.update(value: 1)
  	# else
  	# 	@vote = @post.votes.create(value: 1, user: current_user)
  	# end
  	# redirect_to :back
  	up_down_vote(1)
  end

  def down_vote
  	# @post = Post.find(params[:post_id])
  	# if @post.votes.any? && Vote.last.user == current_user 
  	#   	@post.votes.last.update(value: -1)
  	# else
  	# 	@vote = @post.votes.create(value: -1, user: current_user)
  	# end
  	# redirect_to :back
  	up_down_vote(-1)
  end

private

  def up_down_vote(vote)
  	@post = Post.find(params[:post_id])
  	if @post.votes.any? && Vote.last.user == current_user
  		@post.votes.last.update(value: vote)
  	else
  		@vote = @post.votes.create(value: vote, user: current_user)
  	end
  	redirect_to :back
  end

end





