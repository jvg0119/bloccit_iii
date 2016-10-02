class UserMailer < ApplicationMailer
  
  def email(user)
  	@user = user
  	mail(to: user.email, subject: "This is a test email ***")
  end
  
end
# command to use email for console
# UserMailer.email(user).deliver_now
