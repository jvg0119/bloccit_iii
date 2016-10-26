require 'rails_helper'
include TestFactories

describe Post do 
	describe "vote methods" do

		before do
			#@topic = Topic.create(name: "Topic name", description: "topic description") 
			#@post = @topic.posts.create(title: "Post title", body: "post body")
			
			# stubbing user
			# @post = Post.new(title: "Post title", body: "post body has to be long for this to work")		
			# user_double = double
			# allow(user_double).to receive(:votes) { @post.votes }
			# allow(@post).to receive(:user) { user_double}
			# @post.save
			# or 
			# @post = Post.new(title: "Post title", body: "post body has to be long for this to work")		
			# user_double = double(votes: @post.votes)
			# allow(@post).to receive(:user) { user_double }
			# @post.save

			# stub create_vote   a post method
			# @post = Post.new(title: "Post title", body: "post body has to be long for this to work")		
			# allow(@post).to receive(:create_vote) {} # @post.create_vote returns nil
			# @post.save	# when you save post it does not create a vote (nil)
			# specs are now passing but w/o the post validations

			@post = associated_post

			3.times { @post.votes.create(value: 1) }
			2.times { @post.votes.create(value: -1) }
		end

		describe '#up_votes' do 
			it "counts the number of votes with value = 1" do 	
				expect(@post.up_votes).to eq(3)
				# puts @post.title
				# puts @post.user.email
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
		# describe "#create_vote" do ## move to it's own because this is not a vote method
		# 	it "generates an up_vote when explicitly called" do 
		# 		expect(@post.create_vote.value).to eq(1)#eq(Vote.last)
		# 	end
		# end
	end
	describe "#create_vote" do
		it "generates an up_vote when explicitly called" do
			 post = associated_post
			 expect(post.up_votes).to eq(0)
			 post.create_vote
			 expect(post.up_votes).to eq(1)
		#	 or
			 expect(post.create_vote.value).to eq(1)#eq(Vote.last)
		#   or 
			expect { post.create_vote }.to change{post.up_votes}.by(1)
		#	or
			expect { post.create_vote }.to change{post.up_votes}.from(3).to(4)
		#	or
			expect { post.create_vote }.to change(post, :up_votes).by(1)
		end
	end

end




# def authenticated_user 			# devise require unique email
# 	user = User.new(email: "user#{rand}@example.com", password: "password")
# 	user.skip_confirmation!
# 	user.save # save method returns true or false
# 	user  # need to return user to get user
# end

# def authenticated_user(options={}) 			# devise require unique email
# 	user = User.new({ email: "user#{rand}@example.com", password: "password" }.merge(options))
# 	user.skip_confirmation!
# 	user.save # save method returns true or false
# 	user  # need to return user to get user
# end
# or
# def authenticated_user(options={}) 			# devise require unique email
# 	user_option = ({ email: "user#{rand}@example.com", password: "password" }.merge(options))
# 	user = User.new(user_option)
# 	user.skip_confirmation!
# 	user.save # save method returns true or false
# 	user  # need to return user to get user
# end
# or 
# final below
# def authenticated_user(options={}) 			# devise require unique email
# 	user_option = { 
# 		email: "user#{rand}@example.com", 
# 		password: "password" 
# 		}.merge(options)
# 	user = User.new(user_option)
# 	user.skip_confirmation!
# 	user.save # save method returns true or false
# 	user  # need to return user to get user
# end


# def associated_post
# 	topic = Topic.new(name: "Topic name") # no validations for topic
# 	user = authenticated_user
# 	post = Post.create(title: "Post title", body: "post body has to be long for this to work",
# 		topic: topic, user: user)
# end

# def associated_post(options={})
# 	topic = Topic.new(name: "Topic name") # no validations for topic
# 	user = authenticated_user
# 	post = Post.create({title: "Post title", body: "post body has to be long for this to work",
# 		topic: topic, user: user}.merge(options))
# end
# or 
# def associated_post(options={})
# 	topic = Topic.new(name: "Topic name") # no validations for topic
# 	user = authenticated_user
# 	post_option = ({title: "Post title", body: "post body has to be long for this to work",
# 		topic: topic, user: user}.merge(options))
# 	post = Post.create(post_option)
# end
# or
# final below 
# def associated_post(options={})
# 	topic = Topic.new(name: "Topic name") # no validations for topic
# 	user = authenticated_user
# 	post_option = {
# 		title: "Post title", 
# 		body: "post body has to be long for this to work",
# 		topic: topic, 
# 		user: user
# 		}.merge(options)
# 	post = Post.create(post_option)
# end








