require 'rails_helper'

describe 'User properties' do

	context 'Without any properties and user is signed in' do
		
		before(:each) do
		  john = create(:user)
			login_as john
		end

		it 'shows a message' do
			visit '/'
			click_link 'My properties'
			expect(page).to have_content 'No properties have been added.'
		end

		it 'can create a property' do
			visit '/'
			click_link 'Add property'
			fill_in :property_title, with: 'Great flat near old street'
			fill_in :property_address, with: '25 city road'
			fill_in :property_postcode, with: 'EC1Y 1AA'
			fill_in :property_city, with: 'London'
			fill_in :property_description, with: 'Makers Academy'
			click_button 'Submit'
			expect(page).to have_content('The property has been successfully created')
			expect(page).to have_content('Posted by - John')
		end

	end

	context 'with a property' do

		before(:each) do
		  john = create(:user)
		  john.properties << create(:makers_academy)
			login_as john
		end

		it 'can show the profile of the creator of the property' do
			visit '/'
			search_home_for("25 city road,London,EC1Y 1AA")
			click_link 'Great flat near old street'
			click_link 'John'
			expect(page).to have_content 'John'
		end
		
	end

	context 'without a user signed in' do

		it 'cant add a property' do
			visit '/properties/new'
			expect(page).to have_content ('You need to sign in or sign up before continuing.')
		end

		it 'add property link is not present' do
			visit '/'
			expect(page).not_to have_content ('Add property')
		end

	end

end