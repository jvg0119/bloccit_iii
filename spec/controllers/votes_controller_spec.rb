require 'rails_helper'

describe VotesController do 

include TestFactories
#include Devise::TestHelpers # deprecated
include Devise::Test::ControllerHelpers # access to devise helpers

	describe "#up_vote" do 
		it "adds an up-vote to the post" do 
			# request.env["HTTP_REFERER"] = '/' # or root_url  # not needed if you change to params below
			@user = authenticated_user
			@post = associated_post # creates a post w/ a user
			sign_in @user
		#	expect { post( :up_vote, post_id: @post.id) }.to change{ @post.up_votes }.by(1)
			expect { post :up_vote, params: { post_id: @post.id } }.to change { @post.up_votes }.by(1) # rails 5
		end
	end

	describe "#down-vote" do  # mostly the same as the up_vote
		it "adds a down-vote to the post" do 
			# request.env["HTTP_REFERER"] = '/' # or root_url  # not needed if you change to params below
			@user = authenticated_user
			@post = associated_post # creates a post w/ a user
			sign_in @user
		#	expect { post( :up_vote, post_id: @post.id) }.to change{ @post.up_votes }.by(1)
			expect { post :down_vote, params: { post_id: @post.id } }.to change { @post.down_votes }.by(1)
		end
		# it "test only" do 
		# 	@post = associated_post
		# 	#post :up_vote, post_id: @post.id
		#  	post :up_vote, params: { post_id: @post.id }  
		# 	#process :up_vote, method: :post, params: { post_id: @post.id }  
		# end
	end
	
end

