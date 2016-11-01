require 'rails_helper'

describe FavoritesController do 

include TestFactories
include Devise::Test::ControllerHelpers # access to devise helpers

  before do 
  	@post = associated_post
  	@user = authenticated_user
  	sign_in(@user)
  end
  
  describe "#create" do 
    it "creates a favorite by the current user on the specific post" do
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil # empty at start
      # post :create, { post_id: @post.id } # deprecated
      post :create, params: { post_id: @post.id } # creates a favorite
       expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil # not empty anymore
      # expect( @user.favorites.where(post_id: @post.id).first).not_to be_nil # OK; same result
    end

  end  ## create

   describe "#destroy" do 
  	it "removes the favorite for the current user and post" do 
     # byebug
  		favorite = @user.favorites.where(post: @post).create # create a favorite first
  		expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil # not empty	
  		# delete :destroy, { post_id: @post.id, id: favorite.id } # deprecated
      # byebug		
  		delete :destroy, params: { post_id: @post.id, id: favorite.id } # deletes favorite
  		expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil # empty now
  	end

  end ## destroy

end ## FavoritesController





