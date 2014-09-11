# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Review.destroy_all
Property.destroy_all
Picture.destroy_all

titles = ["Gorgeous large modern flat - Angel Shoreditch area"]

descriptions = ["The flat is a 1, 000 sq ft 3 bedroom flat, there are two bathrooms (including an en-suite for the master room), a large eat in kitchen, and a sizeable lounge. The flat obviously has all mod cons, broadband, sky etc.
THe area is AMAZING in so many respects! Transport links are fantastic, you have 3 bus links on the doorstep (76 to Waterloo, 21 to Lewisham via City, and 141 to London bridge) all buses take you to Old Street station on the northern line in less than 5 mins, or it's an easy 15 minute walk door to door."]


marco = User.create(username: "marco", email: "marco@test.com", password: "12345678", password_confirmation: "12345678")
jean = User.create(username: "jean", email: "jean@test.com", password: "12345678", password_confirmation: "12345678")
alex = User.create(username: "alex", email: "alex@test.com", password: "12345678", password_confirmation: "12345678")

picture_1 = File.new(Rails.root.join('public/images/room1.jpg'))
picture_2 = File.new(Rails.root.join('public/images/outside1.jpg'))

pictures = [picture_1, picture_2]

users = [marco, jean]

1.upto(3) do |n|
  property = Property.create(title: titles.sample, description: descriptions.sample, address: '341 Upper St', city: 'London', postcode: 'N1 0PB')
  users.sample.properties << property
  2.times { property.pictures.create(image: pictures.sample) }
  users.sample.reviews << Review.create(thoughts: 'Had a great time in this flat. The place is very central and close to various amenities. I had a room with my own private bathroom and a shared kitchen where I could cook. The place is clean and well kept. I also high speed internet access.', rating: 5, user_id: users.sample.id)
end