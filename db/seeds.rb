# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	
	@file = JSON.parse(File.read(Rails.root + "public/db.json"))
	# @users = @file['users']
	# @posts = @file['posts']
	# @comments = @file['comments']
	# @albums = @file['albums']
	@photos = @file['photos']
	url = []
	thumb = []

	@photos.each do |p|
		# puts (p['url'].inspect[1..p['url'].length-2])
		url.push(p['url'].inspect[1..p['url'].length-2])
		thumb.push(p['thumbnailUrl'].inspect[1..p['url'].length-2])
	end


	usersIds = []
	postIds = []
	
	#  Create USER
	(0..9).each do |i|
		user = User.create( name: (Forgery('name').first_name), username: Forgery('internet').user_name, email: Forgery('email').address, pass: 'U2FsdGVkX18En4ayH8lYGrMqC79skJGPGwToiI+Vf9o=', address: Forgery('address').street_address+' '+Forgery('address').street_number, city: Forgery('address').city, phone: Forgery('address').phone, website: Forgery('internet').domain_name, company: Forgery('name').company_name)
		puts user.inspect
		usersIds.push(user.id)
	end

	puts usersIds.inspect
	# create Posts
	usersIds.each do |i|
		post = Post.create( title: Forgery('lorem_ipsum').title, body: Forgery('lorem_ipsum').paragraph, user: User.find(i))
		(0..4).each do |j|
			Comment.create( name:  Forgery('lorem_ipsum').title, body: Forgery('lorem_ipsum').paragraph, post: post, user: User.find(usersIds.shuffle.first))
		end
		postIds.push(post.id)

		albumIds = []
		(0..2).each do |a|
			album = Album.create( title: Forgery('lorem_ipsum').title, user: User.find(i) )
			albumIds.push(album.id)
		end

		albumIds.each do |q|
			(0..4).each do |w|
				indexUrl = (0..url.length-1).to_a.shuffle.first
				Photo.create( title: Forgery('lorem_ipsum').title, url: url[indexUrl].inspect, thumbnailurl: thumb[indexUrl].inspect, album: Album.find(q) )
			end
		end

	end
	
