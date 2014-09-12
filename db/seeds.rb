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

titles = ["Gorgeous large modern flat - Angel Shoreditch area","Double Bedroom in Old Street","Room in Amazing New Flat in beautiful London","Double rooms/Lounge & Balcony", "Nice Double Mins Away from Shoreditch Overground", "3 Bedroom Fully Furnished Flat"]

descriptions = ["The flat is a 1, 000 sq ft 3 bedroom flat, there are two bathrooms (including an en-suite for the master room), a large eat in kitchen, and a sizeable lounge. The flat obviously has all mod cons, broadband, sky etc.
The area is AMAZING in so many respects! Transport links are fantastic, you have 3 bus links on the doorstep (76 to Waterloo, 21 to Lewisham via City, and 141 to London bridge) all buses take you to Old Street station on the northern line in less than 5 mins, or it's an easy 15 minute walk door to door.","3 minute walk from Old Street Station and a further 10 minute walk to more than 4 other train stations. At the moment there is just one other person including myself, I am a student and so do not spend of my time at home, the other tenant is working. We share most of the eating expenses but if you want to only pay for yourself that will be just fine. The room is a double bedroom and used to belong to a student who moved out only about 1 week ago.","The flat is pretty much brand new, is fully furnished with quality new gear and is great for sharing. Your room is large, has a double bed and best of all you have your own bathroom, which is very rare for an flat this nicely decked out and this close to the city.","a lovely bedroom property situated between Angel and Kings Cross St Pancras tube station. Convenient for the shops, bars and restaurants of vibrant Upper Street, with easy access to the City, Shoreditch and the West Ends shopping district.
The property comprises of two good-sized double bedrooms & the third with spacious lounge, which leads out onto a private balcony overlooking the communal park, a good size modern fully fitted kitchen with appliances, and a tiled bathroom and three separate storage spaces.", " Fabulous double room available in a three Bedroom Duplex Flat with its own balcony and huge storage space, located on the 3rd floor of a well-maintained and nice building in between Kings Cross and Caledonian Road Stations. THE FLAT: The flat is a 3-bedroom duplex flat, although there is not a living room, the kitchen is fully equipped with dining table, hot water, washing machine, large fridge, oven, kettle, microwave, toaster and pretty much anything you need to have a pleasant stay. There is full heating system that works great, 24/7 hot water; separate toilet and bathroom. The flat has beautiful laminate floor throughout.", "Cose to transport, five minutes Hoxton station 15 minutes Old St station Convenient for Hoxton St Market and the Bars, Restaurants and Night Life of Hoxton, Shoreditch"]

address = ['341 Upper St,London,N1 0PB','25 City Rd,London,EC1Y 1AA','91 City Road,London,EC1Y 1AF','70 Leonard St,London,EC2A 4QX','87A Great Eastern Street,London,EC2A','127 91 City Road,London,EC1Y','Weymouth Terrace,London,E2','The South Penthouse,London,EC2Y','Duncan Terrace ,London,N1']

tenant_reviews = ["The perfect person to deal with, Really friendly. Yo can trust him." ,"Very nice flatmate! The atmosphere is warm and friendly","He is an easygoing person, very helpful and sociable","Fue de gran ayuda, siempre pendiente de lo que necesitaba",'Ce proprio m\'a tant comble que je le recommande a toute celles ou tout ceux qui ont besoin de quelqu un sur qui compter']
property_reviews = ["The place is very central and close to various amenities. I had a room with my own private bathroom and a shared kitchen where I could cook. The place is clean and well kept. I also liked the high speed internet access.","Thank you, for making my stay so comfortable x", "Had a great time in this flat.", 'Quite small, poor storage in the bathroom. No wardrobe in second bedroom. Flat had poor ventilation - couldn open the balcony and windows only opened a small way due to their design. Also, quite noisy due to lots if local construction, despite being 8 floors up.', 'Great location and facilities. Perfect for family, 2 very nice double rooms, 2 bathrooms and great living and kitchen area. The checks that City Marque carry out on potential clients are very reassuring so you should not have problems with the apartments being let to stag or hen party groups. The system for collecting keys is first class. All in all, a brilliant place to stay. Highly recommended','The room we had was really a small small flat.','The management was very helpful.','This accommodation is the best location to stay in Old Street, we were in a quiet place and very close to the bus stops,','I really enjoyed my stay at this quiet homestay in the heart of London, I would recommend it especially for students','Mi estadia durante estos tres meses fue increible, el cuarto estaba impecable','La propiedad esta en perfecto estado, muy bien cuidada. 100% recomendada']

marco = User.create(username: "marco", email: "marco@test.com", password: "12345678", password_confirmation: "12345678", bio: "Easy going person, I am very friendly and sociable. I really care for my tenants I am from Venezuela and I am also a French national. I am very quiet and a very easy going. I speak Spanish and English.")
jean =  User.create(username: "jean",  email: "jean@test.com",  password: "12345678", password_confirmation: "12345678", bio: 'I live and work in London. I have a lovely place, where I enjoy cooking (and eating), good music and nice evenings with friends. I look forward to meeting you!')
alex =  User.create(username: "alex",  email: "alex@test.com",  password: "12345678", password_confirmation: "12345678", bio: 'I am french, I really like to look after my tenants. You can check my reviews and see the way that I treat my tenants.')

marco.pictures.create(image: File.new(Rails.root.join('public/images/marco.jpg')))
jean.pictures.create(image: File.new(Rails.root.join('public/images/jean.jpg')))
alex.pictures.create(image: File.new(Rails.root.join('public/images/alex.jpg')))

room_1 = File.new(Rails.root.join('public/images/room_1.jpg'))
outside_1 = File.new(Rails.root.join('public/images/outside_1.jpg'))
room_2 = File.new(Rails.root.join('public/images/room_2.jpg'))
outside_2 = File.new(Rails.root.join('public/images/outside_2.jpg'))
room_3 = File.new(Rails.root.join('public/images/room_3.jpg'))
outside_3 = File.new(Rails.root.join('public/images/outside_3.jpg'))

rooms = [room_1,room_2,room_3]  
outsides = [outside_1,outside_2,outside_3]

users = [marco, jean, alex]


1.upto(10) do |n|
  property_address = address.sample.split(",")
  property = Property.create(title: titles.sample, description: descriptions.sample, address: property_address[0] , city: property_address[1], postcode: property_address[2], total_rooms:[*1..3].sample.to_s)
  users.sample.properties << property
  property.rooms.each { |room| room.update(user_id: users.sample.id) }
  property.pictures.create(image: outsides.sample)
  property.pictures.create(image: rooms.sample)
  2.times { users.sample.reviews << Review.create(thoughts: tenant_reviews.sample, rating: [*1..5].sample, user_id: users.sample.id) }
  [*5..8].sample.times { property.reviews << Review.create(thoughts: property_reviews.sample, rating: [*1..5].sample, user_id: users.sample.id) }
	puts "#{n} uploaded"
end





