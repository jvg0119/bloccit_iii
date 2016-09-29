# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.upto(5) do 
	user = User.new(
		name: Faker::Name.name, 
		email: Faker::Internet.email,
		password: "password",
		password_confirmation: "password"
		)
	user.skip_confirmation!
	user.save!
end

user = User.new(
		name: "Joe", 
		email: "joe@example.com",
		password: "password",
		password_confirmation: "password"
		)
	user.skip_confirmation!
	user.save!

users = User.all 

1.upto(50) do 
	Post.create!(
		user: users.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end
posts = Post.all

1.upto(100) do 
	Comment.create!(
		post: posts.sample,
	#	post_id: posts.sample.id,   ## OK
		body: Faker::Lorem.paragraph
		)
end

puts "*".center(40,"*")
puts
puts "Done Seeding".center(40)
puts "#{User.count} users were created.".center(40)
puts "#{Post.count} posts were created.".center(40)
puts "#{Comment.count} comments were created.".center(40)
puts
puts "*".center(40,"*")











