require 'rails_helper'

describe Comment do 

  include TestFactories
  #include Devise::Test::IntegrationHelpers

  before do 
  	@post = associated_post
  	@user = authenticated_user(email_favorites: true)
  	@other_user = authenticated_user
  	#sign_in(@user) # does not need to be signed in since this is an after_create method
  	@comment = Comment.new(body: "This is my post comment.", post: @post, user: @other_user)
 #   @comment = Comment.new(body: "This is my post comment.", post: @post, user: @user)
  end 

  describe "after_create" do
    it "sends email to users who favorited the post" do
      favorite = @user.favorites.create(post: @post) 	# need a post that is favorited by a user to send email to
      allow( FavoriteMailer )
         .to receive(:new_comment)
         .with(@user, @post, @comment)
         .and_return( double(deliver_now: true) )

         expect( FavoriteMailer ).to receive(:new_comment)
         @comment.save
       end

    it "does not send email to users who haven't" do 
      expect( FavoriteMailer ).not_to receive(:new_comment)
      @comment.save
    end

  end ## after_create

end ## Comment





