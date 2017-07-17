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

25.times do
	Story.create!(
		title:	Faker::Book.title,
		body: 	Faker::Lorem.paragraph
		)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Story.count} stories created"