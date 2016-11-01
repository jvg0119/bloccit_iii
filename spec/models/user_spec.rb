require 'rails_helper'

describe User do 
  
  include TestFactories

  describe "#favorited(post)" do
  	before do
  		@post = associated_post 
		@user = authenticated_user #(email_favorites: true)
	end 

  	it "returns nil if user has not favorited a post" do
  		expect(@user.favorited(@post)).to eq(nil)
  		# byebug 
  	end

  	it "returns the appropriate favorite if it exist" do # this method returns a favorite (object) when created
  														 # favorite points to a favorited post
      	favorite = @user.favorites.where(post: @post).create  # creates a favorite 
		# favorite = @user.favorites.create(post: @post) # this also creates a favorite for @post
		expect(@user.favorited(@post)).to eq(favorite)
  	end

  end ## #favorited(post)

end ## User



