require 'rails_helper'

describe "Visiting profiles" do

	include TestFactories
  	include Warden::Test::Helpers
  	#Warden.test_mode!

	before do 
		@user = authenticated_user###(name: "Joe")
		@post = associated_post(user: @user) 
		#@comment = Comment.create(body: "This is the comment's body.", user: @user)
		@comment = Comment.new(body: "This is the comment's body.", user: @user, post: @post)
		allow(@comment).to receive(:send_favorite_emails) # stub :new_coment
		@comment.save!
	end  
	describe "not signed in" do
		it "shows profile" do
			visit user_path(@user) 
			expect(current_path).to eq(user_path(@user))
			# save_and_open_page
			 expect(page).to have_content(@user.name )
###			 expect(page).to have_content("Joe" )
			 expect(page).to have_content(@post.title )
			 #byebug
			 #save_and_open_page
			 expect(page).to have_content(@comment.body )
		end
	end
		describe "signed in" do 
		before do 
			login_as(@user, scope: :user)
		end
		it "shows profile" do 
			visit user_path(@user)
			expect(current_path).to eq(user_path(@user))
			expect(page).to have_content(@user.name )
			expect(page).to have_content(@post.title )
			expect(page).to have_content(@comment.body )
		end
	end


end  # Visiting profiles



