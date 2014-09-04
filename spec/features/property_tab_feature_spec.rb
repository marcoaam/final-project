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
		it 'I can directly see the details of the flat', js: true do
			visit('/properties/21')
			expect(page).to have_content("Makers Academy")
			expect(page).to have_content("2 rooms")
			expect(page).to have_content("Makers Academy")
			expect(page).to have_content("Makers Academy")
		end
	end

	context 'landlord' do
		it 'can click on the the tab and show the content', js: true do
			visit('/properties/21')
			visit('/properties/21#landlord-tab')
			expect(page).to have_content("Makers Academy")
		end
	end

	context 'room' do
		it 'can click on the the tab and show the content' do
		end
	end
end