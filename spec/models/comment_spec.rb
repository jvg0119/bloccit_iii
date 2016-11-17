require 'rails_helper'

describe Comment do 

  include TestFactories
  #include Devise::Test::IntegrationHelpers

  describe "after_create" do

    before do 
      @post = associated_post
    	@user = authenticated_user(email_favorites: true)
    	@other_user = authenticated_user
      @comment = Comment.new(body: "This is my post comment.", post: @post, user: @other_user)
    end 

     # We don't need to change anything for this condition;
     # The email_favorites attribute defaults to true
     context "with user's permission" do

      it "sends email to users who favorited the post" do
        # favorite = @user.favorites.create(post: @post) 	## this will work; it creates favorite w/ @post
                                                          ## this was changed on bloc to the one below
        @user.favorites.where(post: @post).create 
        # finds favorites w/ @post then creates a favorite w/ @post
        # there are no favorites to start w/ anyway
        
        # deliver_now_double = double("deliver")
        # allow(deliver_now_double).to receive(:deliver_now).and_return(true)
        # allow( FavoriteMailer ).to receive(:new_comment).and_return(deliver_now_double)

        # deliver_now_double = double(deliver_now: true) # shorter version from the one above              
        # expect(deliver_now_double).to respond_to(:deliver_now) # this is a quick check only
        # expect(deliver_now_double.deliver_now).to eq(true)     # this is also a quick check
        # allow( FavoriteMailer ).to receive(:new_comment).and_return(deliver_now_double)

        allow( FavoriteMailer )
        .to receive(:new_comment).and_return( double(deliver_now: true) ) # this is the shortest version
    
        expect( FavoriteMailer ).to receive(:new_comment)
        @comment.save
        # byebug
      end

      it "does not send email to users who haven't" do 
        expect( FavoriteMailer ).not_to receive(:new_comment)
        @comment.save # it should not fail when you save it will not receive :new_comment
      end             # there is no post.favorites

    end ## with user's permission

    context "without user's permission" do 

      before { @user.update_attribute(:email_favorites, false) } # changes @user

      it "does not send emails, even to users who have favorited" do
        favorite = @user.favorites.where(post: @post).create # this @user has email_favorites = false
        expect(FavoriteMailer).not_to receive(:new_comment)
       # byebug
        @comment.save # does not receive :new_comment because @user.email_favorites is false
                      # even if there is a post.favorites
      #  byebug
      end

    end  ## without user's permission

  end ## after_create

end ## Comment

