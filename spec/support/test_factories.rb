module TestFactories

	def authenticated_user(options={})
		user_options = {email: "user#{rand}@example.com", password: "password"}.merge(options)
		user = User.new(user_options)
		user.skip_confirmation!
		user.save # save method returns true or false
		user  # need to return user to get user
		
		# or (non flexible)
		# user = User.new({email: "user@example.com", password: "password"}.merge(options))
		# user.skip_confirmation!
		# user.save
		# user
	end

	def associated_post(options={})
		post_options = {
			title: 'Post title', 
			body: 'Post bodies must be pretty long', 
			topic: Topic.create(name: "Topic name"), # no validations for topic
			user:  authenticated_user
			}.merge(options)
			post = Post.create(post_options)
	end

end
