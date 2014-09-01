require 'rails_helper'

describe 'Room' do

	before(:each) do
		property = Property.create(title: 'Great flat near old street')
		property.rooms.create(number: 1, description: 'Big room')
		property.rooms.create(number: 2, description: 'Small room')
	end

	it 'shows the number of rooms' do
		visit '/properties'
		click_link 'Great flat near old street'
		expect(page).to have_content '2 rooms'
	end

end