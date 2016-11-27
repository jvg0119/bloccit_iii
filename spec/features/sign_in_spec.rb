require 'rails_helper'

describe 'Sign in flow' do 
	include TestFactories

	describe "successful" do 
		it "redirects to the topics index" do 
			user = authenticated_user 
			visit root_path
			
			#within  '.jumbotron' do # ok also     #'.user-info' do ## did not add
			
			# within  '.navbar' do # 
          		# click_link 'Sign In'
          	# end
         	click_on "sign_in id"
 
			fill_in 'Email', with: user.email
       		fill_in 'Password', with: user.password

       		within 'form' do  # w/ or w/o within works
       			click_button 'Log in'
       		end
       		# expect(current_path).to eq('/topics') # same as below
       		 expect(current_path).to eq(topics_path)
			#save_and_open_page
			# byebug
		end
	end
end # Sign in flow 

