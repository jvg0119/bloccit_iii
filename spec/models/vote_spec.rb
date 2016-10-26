require 'rails_helper'
include TestFactories

describe Vote do 
	describe "validations" do 
		describe "value validation" do 
			it "allows 1 as value" do
				vote = Vote.new(value: 1)
				expect(vote.valid?).to eq(true)
			end
			it "allows -1 as value" do 
				vote = Vote.new(value: -1)
				expect(vote.valid?).to eq(true)
			end
			it "does not allow 2 as value" do 
				vote = Vote.new(value: 2)
				expect(vote.valid?).to eq(false)
			end
		end
	end
	
	describe "after_save" do   # callback
		it "calls Post#update_rank after save" do 
			post = associated_post(title: "My new post title for the after_save method.", user: authenticated_user(email: "joe@example.com"))
			# just testing the flexible fixture by adding arguments to pass
			# p post; p post.user
			vote = Vote.new(value: 1, post: post )
			# or 
			#vote = post.votes.new(value: 1)
			expect(post).to receive(:update_rank)
			vote.save
		 	# vote#save will trigger afterv_save :update_post method will trigger post#update_rank
		end
	end	
	
end
