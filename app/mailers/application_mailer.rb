class ApplicationMailer < ActionMailer::Base
  default from: "joe@joegarciasj.com" 	#'from@example.com' 
  										# use @joegarciasj.com so it does not go to spam
  layout 'mailer'
end
