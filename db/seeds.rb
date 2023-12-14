# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'open-uri'

Friend.destroy_all
Friend.all.each do |friend|
  friend.photo.purge
end
User.destroy_all
User.all.each do |user|
  user.photo.purge
end


jack = User.new(
  name: "Jack Sparrow",
  email: "jack@gmail.com",
  password: "password"
)
file = URI.open("https://www.lexpress.fr/resizer/3LDbc2XEPXv8WwlzOQITI36rQ_Y=/arc-photo-lexpress/eu-central-1-prod/public/ICEIIMCKNFEKLCF5IFJGBWDZ44.jpg")
jack.photo.attach(io: file, filename: "user-picture-1", content_type:"image/png")
jack.save!

frodon = User.new(
  name: "Frodon Saquet",
  email: "frodon@gmail.com",
  password: "password"
)
file = URI.open("https://pm1.aminoapps.com/6569/4f2be30a6bbc5871357443f1b9808c842640e886_00.jpg")
frodon.photo.attach(io: file, filename: "user-picture-2", content_type:"image/png")
frodon.save!

friend = ""
3.times do
  friend = Friend.new(
    name: Faker::Name.name,
    user: frodon,
    price_per_day: rand(50..300),
    description: Faker::Lorem.paragraph(sentence_count: 2)
  )
  file = URI.open("https://thispersondoesnotexist.com")
  friend.photo.attach(io: file, filename: "friend-picture-#{Friend.count}", content_type:"image/png")
  friend.save!
end

booking = Booking.new(
  friend: friend,
  user: jack,
  start_date: Date.new(2023, 1, 1),
  end_date: Date.new(2023, 1, 15),
  total_price: 80*15
)
booking.save!


friend = Friend.new(
  name: Faker::Name.name,
  user: jack,
  price_per_day: rand(50..300),
  description: Faker::Lorem.paragraph(sentence_count: 6)
)
file = URI.open("https://thispersondoesnotexist.com")
friend.photo.attach(io: file, filename: "friend-picture-#{Friend.count}", content_type:"image/png")
friend.save!
