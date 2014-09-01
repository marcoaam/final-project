require 'rails_helper'

describe 'Property' do

	before(:each) do
		Property.create(title: 'Great flat near old street')
	end

	it 'shows a list of properties' do
		visit '/properties'
		expect(page).to have_content 'Great flat near old street'
	end

	it 'can create a property' do
		visit '/properties/new'
		fill_in :property_title, with: "Great flat near old street"
		fill_in :property_address, with: "25 city road"
		fill_in :property_postcode, with: "EC1Y 1AA"
		fill_in :property_city, with: "London"
		fill_in :property_description, with: "Makers Academy"
		click_button 'Submit'
		expect(page).to have_content("Great flat near old street")
	end

	it 'can click a button to add a property' do
		visit('/properties')
		click_link("Add property") 
		expect(current_path).to eq('/properties/new')
	end


end