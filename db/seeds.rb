# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	puts LoremIpsum.lorem_ipsum(words: 10)
	puts "-------------------------------------------"
	puts LoremIpsum.lorem_ipsum(10, format: :title_case)

	@file = JSON.parse(File.read(Rails.root + "public/db.json"))
	@users = @file['users']
	@posts = @file['posts']
	@comments = @file['comments']
	@albums = @file['albums']
	@photos = @file['photos']

	url = []
	thumb = []

	# @photos.each do |p|
	# 	# puts (p['url'].inspect[1..p['url'].length-2])
	# 	url.push(p['url'].inspect[1..p['url'].length-2])
	# 	thumb.push(p['thumbnailUrl'].inspect[1..p['url'].length-2])
	# end


	usersIds = []
	postIds = []
	
	#  Create USER
	@users.each do |i|
		user = User.create( name: i['name'], username: i['username'], email: i['email'], pass: 'U2FsdGVkX18En4ayH8lYGrMqC79skJGPGwToiI+Vf9o=', address: i['address']['street']+' '+i['address']['suite'], city: i['address']['city'], phone: i['phone'], website: i['website'], company: i['company']['name'])
		puts user.inspect
		usersIds.push(user.id)
	end

	puts usersIds.inspect
	@posts.each do |i|
		Post.create( title: i['title'], body: i['boby'], user: User.find(i['userId']))
	end	
	@comments.each do |i|
		Comment.create( name:  i['name'], body: i['body'], post: Post.find(i['postId']), user: User.find(rand(1..10)))
	end
	@albums.each do |i|
		Album.create( title: i['title'], user: User.find(i['userId']) )
	end
	@photos.each do |i|
		Photo.create( title: i['title'], url: i['url'], thumbnailurl: i['thumbnailUrl'], album: Album.find(i['albumId']) )
	end
	# create Posts

=begin	
		usersIds.each do |i|
		post = Post.create( title: LoremIpsum.lorem_ipsum(words: rand(4..10)), body: LoremIpsum.lorem_ipsum(words: rand(20..50)), user: User.find(i))
		(0..4).each do |j|
			Comment.create( name:  LoremIpsum.lorem_ipsum(words: rand(4..10)), body: LoremIpsum.lorem_ipsum(words: rand(20..50)), post: post, user: User.find(usersIds.shuffle.first))
		end
		postIds.push(post.id)

		albumIds = []
		(0..2).each do |a|
			album = Album.create( title: LoremIpsum.lorem_ipsum(words: rand(4..10)), user: User.find(i) )
			albumIds.push(album.id)
		end

		albumIds.each do |q|
			(0..4).each do |w|
				indexUrl = (0..url.length-1).to_a.shuffle.first
				Photo.create( title: LoremIpsum.lorem_ipsum(words: rand(4..10)), url: url[indexUrl].inspect, thumbnailurl: thumb[indexUrl].inspect, album: Album.find(q) )
			end
		end

	end
=end