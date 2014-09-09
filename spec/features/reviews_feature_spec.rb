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
		expect(page).to have_content 'No reviews have been added.'
	end

	it 'leaves one for a property' do
		visit '/'
		click_link 'My properties'
		click_link 'Great flat near old street'
		fill_in 'review_thoughts', with: 'Great property'
		choose('3')
		click_button 'Leave review'
		expect(page).to have_content 'Great property'
	end

	it 'shows a message if no reviews for a user' do
		visit '/'
		search_home_for('25 city road,London,EC1Y 1AA')
		click_link 'Great flat near old street'
		expect(page).to have_content 'No reviews have been added.'
	end

	it 'can leave a review for a user',js: true do
		visit '/'
		search_home_for('25 city road,London,EC1Y 1AA')
		click_link 'Great flat near old street'

		within(:css, "li#landlord") do
      click_link("Landlord")
    end
    
    within(:css, "#form_for_user") do
    	page.find("#star-landlord-1").trigger('click')
      fill_in 'thoughts', with: 'Great landlord'
			click_button 'Leave review'
		end

		within(:css, "li#landlord") do
			click_link("Landlord")
    end

    within(:css, "#user-reviews") do
    	expect(page).to have_content 'Great landlord'
  	end
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

	context 'leave a not conform review' do

		before(:each) do
		  john = create(:user)
		  property = create(:makers_academy)
			john.properties << property
			3.times { property.reviews << create(:review) }
			login_as john
		end

		it 'gives an error message when the user do not select stars', js: true do
			visit('/properties/21')
			fill_in 'review_thoughts', with: 'bob'
			click_button('Leave review')
			expect(page).to have_content'Sorry, you need to put stars'
		end

	end

end	