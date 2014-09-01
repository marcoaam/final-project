require 'rails_helper'

describe 'Property Search' do
	before(:each) do
		Property.create(title: 'London Victoria', address: 'Victoria St', city: 'London', postcode: 'SW1E 5ND')
		Property.create(title: 'Makers Academy', address: '25 city road', city: 'London', postcode: 'EC1Y 1AA')
	end

	it 'can search by address' do
		visit '/'
		fill_in 'search_bar', with: '25 city road,London,EC1Y 1AA'
		click_button 'Search'
		expect(page).to have_content 'Makers Academy'
		expect(page).not_to have_content 'London Victoria'
	end
end