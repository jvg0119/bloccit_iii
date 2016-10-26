class VotesController < ApplicationController

before_action :load_post_and_vote 

  def up_vote
  	update_vote!(1)
  end

  def down_vote
  	update_vote!(-1)
  end

private

  def load_post_and_vote
  	@post = Post.find(params[:post_id])
  	@vote = @post.votes.where(user: current_user).first
  end

  def update_vote!(new_value)
  	if @vote # is true
  		authorize @vote, :update?
  		@vote.update_attribute(:value, new_value)
  	else
  		#@post.votes.create(value: new_value, user: current_user)
  		@vote = @post.votes.build(value: new_value, user: current_user)
  		authorize @vote, :create?
  		@vote.save
  	end
  	# redirect_to :back   ## deprecated for rails 5
    # redirect_back fallback_location: '/'
    redirect_back fallback_location: root_path
  end 

end
