require 'rails_helper'

describe 'Room' do

	before(:each) do
		property = Property.create(title: 'Great flat near old street')
		property.rooms.create(number: 1, description: 'Big room')
		property.rooms.create(number: 2, description: 'Small room')
	end

	it 'shows the number of rooms for one property' do
		visit '/properties'
		click_link 'Great flat near old street'
		expect(page).to have_content '2 rooms'
	end

	it 'show the number of the room ex: room number1...' do
		visit '/properties'
		click_link 'Great flat near old street'
		expect(page).to have_content 'room N°1'
		expect(page).to have_content 'Big room'
		expect(page).to have_content 'room N°2'
		expect(page).to have_content 'Small room'
	end

	it 'can create a property' do
		visit '/properties/new'
		fill_in :property_title, with: "Great flat near old street"
		fill_in :property_address, with: "25 city road"
		fill_in :property_postcode, with: "EC1Y 1AA"
		fill_in :property_city, with: "London"
		fill_in :property_total_rooms, with: "5"
		fill_in :property_description, with: "Makers Academy"
		click_button 'Submit'
		expect(page).to have_content("Great flat near old street")
	end

end