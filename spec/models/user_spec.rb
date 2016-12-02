require 'rails_helper'

describe User do 
  
  include TestFactories

  describe "#favorited(post)" do 
  	xit "returns nil if user has not favorited a post" do 
  	end
  	xit "returns the appropriate favorite if it exist" do 
  	end
  end ## #favorited(post)
# the above were completed in cp51 Favoriting assignment and not merged w/ master

  describe ".top_rated" do
  	before do 
  		@user1 = create(:user)
  		post = create(:post, user: @user1)
  		comment = create(:comment, post: post, user: @user1)

  		@user2 = create(:user)
  		post = create(:post, user: @user2)
  		2.times { create(:comment, post: post, user: @user2) }
  	end 
  	it "returns users ordered by comments + posts" do 
  		expect(User.top_rated).to eq([@user2, @user1])
  	end
  	it "stores a 'posts_count' on user" do 
  		users = User.top_rated
  		expect(users.first.posts_count).to eq(1)
  	end
  	it "stores a 'comments_count' on user" do
  		users = User.top_rated 
  		expect(users.first.comments_count).to eq(2)
  	end
  end
  describe "factory :user_with_post_and_comment" do 
    it "creates a post and a user" do
      user = create(:user_with_post_and_comment)
      #byebug
      expect(user.posts.first.title).to eq("New post title") 
      expect(user.comments.first.body).to eq("New comment body.") 
    end
  end

end ## User



