require 'devise'

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

25.times do
  story = Story.create!(
    title:	Faker::Book.title,
    body: 	Faker::Lorem.paragraphs(20).join('<p>').html_safe,
    genre:  genres.sample,
    author: users.sample.email,
    user: users.sample
    )
  
  rand(0..1).times { story.ratings.create!(value: 1, user: users.sample) }
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Story.count} stories created"
puts "#{Rating.count} ratings created"