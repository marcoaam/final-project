require 'rails_helper'

RSpec.describe Property, :type => :model do
  
	let(:property) do
		create(:makers_academy)
	end

	it 'gathers up address, city and postcode together' do
		expect(property.full_address).to eq('25 city road,London,EC1Y 1AA')
	end

	it 'prints up address, city and postcode in a singl line' do
		expect(property.display_full_address).to eq('25 city road London, EC1Y 1AA')
	end

	it 'returns review for one review or less' do
		expect(property.pluralized_review).to eq 'review'
	end

	it 'returns reviews for many reviews' do
		2.times { property.reviews << create(:review) }
		expect(property.pluralized_review).to eq 'reviews'		
	end

	context 'ratings' do

		it 'without reviews should' do
			expect(property.average_rating).to eq('No reviews have been added.')
		end

		it 'is not valid to leave a review greater than 5' do
			review = property.reviews.new(rating: 10)
	  	expect(review).to have(1).error_on(:rating)
		end

		it 'is not valid to leave a review lower than 5' do
			review = property.reviews.new(rating: -1)
	  	expect(review).to have(1).error_on(:rating)
		end

	end

	context 'Rooms' do

		let(:property_with_one_room) { Property.create(title: 'Makers Academy', total_rooms: 1) }

		it 'creates a room' do
			expect(property_with_one_room.rooms.count).to eq 1
		end

		it 'creates multiple rooms' do
			property_with_room = Property.create(title: 'Makers Academy', total_rooms: 2)
			expect(property_with_room.rooms.count).to eq 2
		end

		it 'updates multiple rooms' do
			room = property_with_one_room.rooms.first
			user = create(:user)
			room.update(user_id: user.id)
			property_with_one_room.update(title: 'Makers Academy', total_rooms: 4)
			expect(property_with_one_room.rooms.first.user.username).to eq 'John'
			expect(property_with_one_room.rooms.count).to eq 4
		end
	end

end
