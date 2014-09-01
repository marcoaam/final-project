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
		fill_in :title, with: "Great flat near old street"
		fill_in :address, with: "25 city road"
		fill_in :postcode, with: "EC1Y 1AA"
		fill_in :city, with: "London"
		fill_in :description, with: "Makers Academy"
		click_button 'Submit'
		expect(page).to have_content("Great flat near old street")
	end

end