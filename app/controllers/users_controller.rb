class UsersController < ApplicationController

  before_action :authenticate_user!

  def update 
  	if current_user.update_attributes(user_params)
  		flash[:notice] = "User was updated successfully!"
  		redirect_to edit_user_registration_path
  	else
  		flash[:error] = "There was an error updating the user. Please try again."
  		render edit_user_registration_path
  	end
  end

private 
  
  def user_params
  	params.require(:user).permit(:name)
  end


end
