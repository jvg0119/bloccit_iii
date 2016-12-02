FactoryGirl.define do 
  factory :user do 
  	name "Joe Garcia"
  	sequence(:email, 100) { |n| "#{name.gsub(/ /,'').downcase}#{n}@example.com" }
  	password "password"
  	password_confirmation "password"
  	confirmed_at Time.now  # confirms email
  end
end

