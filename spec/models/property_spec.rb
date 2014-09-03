require 'rails_helper'

RSpec.describe Property, :type => :model do
  
	let(:property) do
		create(:makers_academy)
	end
	
	it 'gathers up address, city and postcode together' do
		expect(property.full_address).to eq('25 city road,London,EC1Y 1AA')
	end

	it 'returns review for one review or less' do
		expect(property.pluralized_review).to eq 'review'
	end

	it 'returns reviews for many reviews' do
		2.times { property.reviews << create(:review) }
		expect(property.pluralized_review).to eq 'reviews'		
	end
end
