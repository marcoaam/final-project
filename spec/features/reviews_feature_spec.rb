require 'rails_helper'

describe 'Reviews' do
	context 'without reviews' do

	before(:each) do
	  john = create(:user)
		john.properties << create(:makers_academy)
		login_as john
	end

	it 'shows a message if no reviews' do
		visit '/'
		click_link 'My properties'
		click_link 'Great flat near old street'
		click_link 'All reviews'
		expect(page).to have_content 'No reviews have been added.'
	end

	it 'leaves one for a property' do
		visit '/'
		click_link 'My properties'
		click_link 'Great flat near old street'
		click_link 'All reviews'
		fill_in 'Thoughts', with: 'Great property'
		click_button 'Leave review'
		expect(page).to have_content 'Great property'
	end

	it 'shows a message if no reviews for a user' do
		visit '/'
		search_home_for('25 city road,London,EC1Y 1AA')
		click_link 'Great flat near old street'
		click_link 'John'
		click_link 'All reviews'
		expect(page).to have_content 'No reviews have been added.'
	end

	it 'leaves a review for a user' do
		visit '/'
		search_home_for('25 city road,London,EC1Y 1AA')
		click_link 'Great flat near old street'
		click_link 'John'
		click_link 'All reviews'
		fill_in 'Thoughts', with: 'Great landlord'
		click_button 'Leave review'
		expect(page).to have_content 'Great landlord'
	end

end


	context 'with one review' do 

		before(:each) do
		  john = create(:user)
		  property = create(:makers_academy)
			john.properties << property
			property.reviews << create(:review)
			login_as john
		end

		it 'displays the message 1 review' do
		 visit('/')
		 search_home_for('25 city road,London,EC1Y 1AA')
		 expect(page).to have_content("1 review")
		end

	end

	context 'with many reviews' do

			before(:each) do
			  john = create(:user)
			  property = create(:makers_academy)
				john.properties << property
				3.times { property.reviews << create(:review) }
				login_as john
			end

			it 'displays the message 3 reviews' do
			 visit('/')
			 search_home_for('25 city road,London,EC1Y 1AA')
			 expect(page).to have_content("3 reviews")
			end

	end
end	