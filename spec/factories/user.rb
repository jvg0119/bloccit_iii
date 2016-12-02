FactoryGirl.define do 
  factory :user do 
  	name "Joe Garcia"
  	sequence(:email, 100) { |n| "#{name.gsub(/ /,'').downcase}#{n}@example.com" }
  	password "password"
  	password_confirmation "password"
  	confirmed_at Time.now  # confirms email

  	factory :user_with_post_and_comment, class: User do 
  		name "Second User"

  		after(:create) do |user|
  			post = create(:post, title: "New post title", user: user)
  			Comment.create(body: "New comment body.", post: post, user: user )
  		end

  	end
 
  end # factory :user

end

