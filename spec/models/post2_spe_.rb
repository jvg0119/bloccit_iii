require 'rails_helper'
# older version only work with post.rb validations turned off or bypassed (see below)
#	belongs_to :user#, optional: true # optional: true to bypass validation 
#	belongs_to :topic#, optional: true  # optional: true to bypass validation
# spec is turned off  renamed 

describe Post do 
	describe "vote methods" do

		# xbefore do
		# 	#@topic = Topic.create(name: "Topic name", description: "topic description") 
		# 	#@post = @topic.posts.create(title: "Post title", body: "post body")
		# 	@post = Post.create(title: "Post title", body: "post body has to be long for this to work")
		# 	#@post.votes.create(value: 1)
		# 	3.times { @post.votes.create(value: 1) }
		# 	2.times { @post.votes.create(value: -1) }
		# end

		before do
		 #  @post = Post.create(title: "Post title", body: "post body has to be long for this to work")
		
		    # @post = Post.new(title: "Post title", body: "post body has to be long for this to work")
			# post_user = double(votes: @post.votes)  # this is my user
			# allow(@post).to receive(:user) { post_user }
			# @post.save

			# @post = Post.new(title: "Post title", body: "post body has to be long for this to work")
			# my_post_user = double    # this is the long way
			# allow(my_post_user).to receive(:votes) { @post.votes }
			# allow(@post).to receive(:user) { my_post_user }
			# @post.save

		#	@post = Post.new(title: "Post title", body: "post body has to be long for this to work")
			#my_post_user = double    # this is the long way
			#allow(my_post_user).to receive(:votes) { @post.votes }
		#	allow(@post).to receive(:user) {  }
		#	@post.save

		     @post = Post.new(title: "Post title", body: "post body has to be long for this to work")
			 allow(@post).to receive(:create_vote) { }
			 @post.save

			3.times { @post.votes.create(value: 1) }
			2.times { @post.votes.create(value: -1) }
		end

		describe '#up_votes' do 
			it "counts the number of votes with value = 1" do 
				
				expect(@post.up_votes).to eq(3)
			end
		end
		describe '#down_votes' do 
			it "count the number of votes with value = -1" do 
				expect(@post.down_votes).to eq(2)
			end
		end
		describe '#points' do 
			it "returns the sum of all up_votes and down_votes" do 
				expect(@post.points).to eq(1)  # 3 - 2
			end
		end 
	end

end