# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users =======================================
1.upto(3) do 
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
		password_confirmation: "password",
		role: "admin"
		)
user.skip_confirmation!
user.save!

user = User.new(
		name: "Admin", 
		email: "admin@example.com",
		password: "password",
		password_confirmation: "password",
		role: "admin"
		)
user.skip_confirmation!
user.save!

user = User.new(
		name: "moderator", 
		email: "moderator@example.com",
		password: "password",
		password_confirmation: "password",
		role: "moderator"
		)
user.skip_confirmation!
user.save!

user = User.new(
		name: "member", 
		email: "member@example.com",
		password: "password",
		password_confirmation: "password"
		)
user.skip_confirmation!
user.save!

users = User.all 

# topics =======================================
1.upto(15) do 
	Topic.create!(
		name: Faker::Lorem.sentence(3),
		description: Faker::Lorem.paragraph
		)
end
topics = Topic.all

# posts =======================================
1.upto(50) do 
	post = Post.create!(
		user: users.sample,
		topic: topics.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
	# set the created_at to a time within the past year
	post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
	post.update_rank
end
posts = Post.all

# comments =======================================
1.upto(100) do 
	Comment.create!(
		user: users.sample,
		post: posts.sample,
	#	post_id: posts.sample.id,   ## OK
		body: Faker::Lorem.paragraph
		)
end

puts "*".center(40,"*")
puts
puts "Done Seeding".center(40)
puts "#{User.count} users were created.".center(40)
puts "#{Topic.count} topics were created.".center(40)
puts "#{Post.count} posts were created.".center(40)
puts "#{Comment.count} comments were created.".center(40)
puts
puts "*".center(40,"*")

