require 'rails_helper'

describe 'Property' do

	context'with no in the db' do

		it 'shows a list of properties' do
			visit '/properties'
			expect(page).to have_content 'No properties have been added.'
		end

	end
	
	context'with at least one in the db' do

		before(:each) do
		  alex = create(:user)
			alex.properties.create(title: 'Makers', address: '25 city road', city: 'London', postcode: 'EC1Y 1AA')
			login_as alex
		end

		it 'can create a property' do
			visit '/properties/new'
			fill_in :property_title, with: "Makers"
			fill_in :property_address, with: "25 city road"
			fill_in :property_postcode, with: "EC1Y 1AA"
			fill_in :property_city, with: "London"
			fill_in :property_description, with: "Makers Academy"
			click_button 'Submit'
			expect(page).to have_content('Property successfully created.')
		end

		it 'can click a button to add a property' do
			visit('/properties')
			click_link("Add property") 
			expect(current_path).to eq('/properties/new')
		end

		it 'can edit a property' do
			visit '/properties'
			click_link 'My properties'
			click_link 'Edit'
			fill_in :property_title, with: "New flat"
			fill_in :property_address, with: "25 city road"
			fill_in :property_postcode, with: "EC1Y 1AB"
			fill_in :property_city, with: "London"
			fill_in :property_description, with: "New one"
			click_button 'Submit'
			click_link 'My properties'
			expect(page).not_to have_content "Makers"
			expect(page).to have_content "New flat"
		end

		it 'can delete a property' do
			visit('/properties')
			click_link 'My properties'
			expect(page).to have_content 'Makers'
			click_link('Delete')
			click_link 'My properties'
			expect(page).not_to have_content 'Makers'
		end

	end
	
end