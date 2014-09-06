require 'rails_helper'

describe 'interactive tab' do

	before(:each) do
		bob = create(:user)
		login_as bob
		bob.properties << create(:makers_academy)
		Property.first.rooms.create(number: 1, description: 'Big room')
		Property.first.rooms.create(number: 2, description: 'Small room')
	end

	context 'flat' do

		it 'can target, open and see what is inside the tab', js: true do
			visit("/properties/21")
			expect(page).to have_content("Makers Academy")
		end

		it 'can target, open and see what is inside the tab', js: true do
			visit("/properties/21")
			within(:css, "li#flat") do
	      click_link("Great flat near old street")
	    end
	    find('#review_thoughts_flat').visible?
		end

	end

	context 'landlord' do

		it 'can target, open and see what is inside the tab', js: true do
			visit("/properties/21")
			within(:css, "li#landlord") do
	      click_link("Landlord")
	    end
	    find('#review_thoughts_landlord').visible?
		end

	end

	context 'room' do

		it 'can target, open and see what is inside the tab', js: true do
			visit("/properties/21")
			within(:css, "li#room-1") do
	      click_link("Room 1")
	    end
	    find('#rooma-1').visible?
		end

	end

end