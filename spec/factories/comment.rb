FactoryGirl.define do 
  factory :comment do 
  	body "This is a comment body."
  	association :post
  	user

  	# does not work for rails 5 
  	# On Rails 5.0, calling skip_callback for a non-existent callback now raises an error by default, 
  	# so when this is called twice on the same class, it will fail the second time as the callback's been deleted.

  	# after(:build) do |comment| 
  	# 	comment.class.skip_callback(:create, :after, :send_favorite_emails) 
  	# end

  	# solution:  before/after(:build) does not work
  	# before(:create) do |comment| 
  	# 	comment.class.skip_callback(:create, :after, :send_favorite_emails) 
  	# end
  	# after(:create) do |comment|
  	# 	comment.class.set_callback(:create, :after, :send_favorite_emails)
  	# end 

  	# shorter versions
  	before(:create) { Comment.skip_callback(:create, :after, :send_favorite_emails) }
  	after(:create) { |comment| comment.class.set_callback(:create, :after, :send_favorite_emails) }

  end
end

