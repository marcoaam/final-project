require 'rails_helper'
	
	describe 'Search Bar' do
	
		it 'show up when visiting the root' do 
			visit('/')
			expect(page).to have_css('#search_bar')
		end

		it 'can submit a search by location' do
			visit '/'
			fill_in 'search_bar', with: '25 city road,London,EC1Y 1AA'
			click_button 'Search'
			expect(current_path).to eq '/properties'
		end

		context ' gives you results of the search'

		before(:each) do
			Property.create(title: 'Great flat near old street', address: '25 city road', city: 'London', postcode: 'EC1Y 1AA')
			Property.create(title: 'London Victoria', address: 'Victoria St', city: 'London', postcode: 'SW1E 5ND')
		end
		
		it 'if the user inputs an address' do
			visit('/')
			fill_in 'search_bar', with: '25 city road,London,EC1Y 1AA'
			click_button 'Search'
			expect(page).to have_content('Great flat near old street')
			expect(page).not_to have_content('London Victoria')
		end

	end