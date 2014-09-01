require 'rails_helper'

RSpec.describe Property, :type => :model do
  
	let(:property) do
		Property.create(title: 'Makers Academy', address: '25 city road', city: 'London', postcode: 'EC1Y 1AA')
	end
	
	it 'gathers up address, city, post the entries from the search form' do
		expect(property.full_address).to eq('25 city road,London,EC1Y 1AA')
	end

end
