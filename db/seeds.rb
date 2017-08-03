require 'devise'
Badge.create!(name: 'founder', description: 'First 100 Accounts')
Badge.create!(name: 'newcomer', description: 'Create a new account')
Badge.create!(name: 'critic', description: 'Like a story')
Badge.create!(name: 'analyst', description: 'Like 5 stories')
Badge.create!(name: 'reviewer', description: 'Like 20 stories')
Badge.create!(name: 'all-thumbs', description: 'Like 100 stories')
Badge.create!(name: 'got-one', description: 'Collect a story')
Badge.create!(name: 'fancier', description: 'Collect 5 stories')
Badge.create!(name: 'collector', description: 'Collect 20 stories')
Badge.create!(name: 'hoarder', description: 'Collect 100 stories')
Badge.create!(name: 'peanut', description: 'Comment on a story')
Badge.create!(name: 'commentator', description: 'Leave 10 comments')
Badge.create!(name: 'pundit', description: 'Leave 25 comments')
Badge.create!(name: 'rookie', description: 'Write a story')
Badge.create!(name: 'contributor', description: 'Write 5 stories')
Badge.create!(name: 'author', description: 'Write 10 stories')

user1 = User.new(
  email:                  'admin@example.com',
  password:               'helloworld',
  password_confirmation:  'helloworld'
)
user1.skip_confirmation!
user1.save!

user2 = User.new(
  email:                  'member@example.com',
  password:               'helloworld',
  password_confirmation:  'helloworld'
)
user2.skip_confirmation!
user2.save!

users = User.all
genres = ['Crime', 'Fan fiction', 'Fantasy', 'Mystery', 'Romance', 
    'Sci-fi', 'Western', 'Horror']

20.times do
  story = Story.create!(
    title:	Faker::Book.title,
    body: 	Faker::Lorem.paragraphs(20).join('<p>').html_safe,
    genre:  genres.sample,
    author: users.sample.email,
    user:   users.sample,
    price: 0
    )
  
  rand(0..1).times { story.ratings.create!(value: 1, user: users.sample) }
end

10.times do
  story = Story.create!(
    title:	Faker::Book.title,
    body: 	Faker::Lorem.paragraphs(20).join('<p>').html_safe,
    genre:  genres.sample,
    author: users.sample.email,
    user:   users.sample,
    price: 1
    )
  
  rand(0..1).times { story.ratings.create!(value: 1, user: users.sample) }
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Story.count} stories created"
puts "#{Rating.count} ratings created"
puts "#{Badge.count} badges created"