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

4.times do
  friend = Friend.new(
    name: Faker::Name.name,
    price_per_day: rand(50..300),
    description: Faker::Lorem.paragraph(sentence_count: 2)
  )
  file = URI.open("https://thispersondoesnotexist.com")
  friend.photo.attach(io: file, filename: "friend-picture-1", content_type:"image/png")
  friend.save!
end

user = User.new(
  name: "Jack Sparrow",
  email: "jack@gmail.com",
  password: "password"
)
file = URI.open("https://www.lexpress.fr/resizer/3LDbc2XEPXv8WwlzOQITI36rQ_Y=/arc-photo-lexpress/eu-central-1-prod/public/ICEIIMCKNFEKLCF5IFJGBWDZ44.jpg")
user.photo.attach(io: file, filename: "user-picture-1", content_type:"image/png")
user.save!
