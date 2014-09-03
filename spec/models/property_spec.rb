require 'rails_helper'

RSpec.describe Property, :type => :model do
  
	let(:property) do
		create(:makers_academy)
	end
	
	# Property.reviews = Review.create(thoughts: 'nice', rating: 0)
	# Property.reviews = Review.create(thoughts: 'nice', rating: 3)

	it 'gathers up address, city and postcode together' do
		expect(property.full_address).to eq('25 city road,London,EC1Y 1AA')
	end
	context'ratings' do

		it 'without reviews should' do
			expect(property.average_rating).to eq('No reviews have been added.')
		end

		it 'is not valid to leave a review greater than 5' do
			review = property.reviews.new(rating: 10)
	  	expect(review).to have(1).error_on(:rating)
		end

		it 'is not valid to leave a review greater than 5' do
			review = property.reviews.new(rating: -1)
	  	expect(review).to have(1).error_on(:rating)
		end

	end
end
