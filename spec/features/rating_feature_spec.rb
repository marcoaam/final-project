require 'rails_helper'

describe 'Ratings' do
	
	context 'flat' do
		
		before(:each) do
			user = create(:user)
		  user.properties << create(:makers_academy)
			login_as user
		end
		
		it 'If someone creates a single rating' do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')
			fill_in 'review_thoughts', with: 'Good'
			choose('3')
			click_button('Leave review')
			expect(page).to have_content('3')
		end

		it 'an average of all ratings written' do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')
			fill_in 'review_thoughts', with: 'Good'
			choose('3')
			click_button('Leave review')
			fill_in 'review_thoughts', with: 'Excellent'
			choose('5')
			click_button('Leave review')
			expect(page).to have_content('4')
		end
	end

	context 'landlord' do
		
		before(:each) do
			user = create(:user)
		  user.properties << create(:makers_academy)
			login_as user
		end
		
		xit 'If someone creates a single rating', js: true do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')

			within(:css, "li#landlord") do
				click_link('Landlord')
			end

			within(:css, ".flat-review-partial") do
				page.find('#thoughts').fill_in
				choose('3')
				click_button('Leave review')
				expect(page).to have_content('3')
			end

		end

		it 'an average of all ratings written' do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')
			visit('/properties/21#landlord-tab')
			fill_in 'review_thoughts', with: 'Good'
			choose('3')
			click_button('Leave review')
			fill_in 'review_thoughts', with: 'Excellent'
			choose('5')
			click_button('Leave review')
			expect(page).to have_content('4')
		end
	end

end