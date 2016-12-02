FactoryGirl.define do 
  factory :post do 
  	title "Post title"
  	body "Post body needs to be long enough."
  	user
  	topic { Topic.create(name: "Topic name") }
  end
end
