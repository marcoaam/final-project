require 'rails_helper'

describe 'Ratings' do
	
	context 'Shows' do
		
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
			choose('review_rating_3')
			click_button('Leave review')
			expect(page).to have_content('3')
		end

		it 'an average of all ratings written' do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')
			fill_in 'review_thoughts', with: 'Good'
			choose('review_rating_3')
			click_button('Leave review')
			fill_in 'review_thoughts', with: 'Excellent'
			choose('review_rating_5')
			click_button('Leave review')
			expect(page).to have_content('4')
		end
	end
end