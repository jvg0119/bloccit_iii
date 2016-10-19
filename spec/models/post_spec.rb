require 'rails_helper'

describe Post do 
	describe "vote methods" do

		before do
			#@topic = Topic.create(name: "Topic name", description: "topic description") 
			#@post = @topic.posts.create(title: "Post title", body: "post body")
			@post = Post.create(title: "Post title", body: "post body has to be long for this to work")
			#@post.votes.create(value: 1)
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
