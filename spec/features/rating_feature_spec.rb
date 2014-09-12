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
			expect(page).to have_content('★★★☆☆')
		end

		it 'an average of all ratings written', js: true do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')

			within(:css, '#review_thoughts_flat') do
				fill_in 'review[thoughts]', with: 'Good'
				page.find("#star-3").trigger('click')
				click_button('Leave review')
			end

			within(:css, '#review_thoughts_flat') do
				fill_in 'review[thoughts]', with: 'Excellent'
				page.find("#star-5").trigger('click')
				click_button('Leave review')
			end
			visit current_path
			expect(page).to have_content('★★★★☆')
		end
	end

	context 'landlord' do
		
		before(:each) do
			user = create(:user)
		  user.properties << create(:makers_academy)
			login_as user
		end
		
		it 'If someone creates a single rating', js: true do
			visit('/')
			click_link('My properties')
			click_link('Great flat near old street')

			within(:css, "li#landlord") do
				click_link('Landlord')
			end

			within(:css, "#form_for_user") do
	      fill_in 'thoughts', with: 'Great landlord'
	    	page.find("#star-landlord-3").trigger('click')
				click_button('Leave review')
			end

			visit current_path

			within(:css, "li#landlord") do
				click_link('Landlord')
			end

			expect(page).to have_content('★★★☆☆')
		end

		it 'an average of all ratings written', js: true do
			visit '/'
			search_home_for('25 city road,London,EC1Y 1AA')
			click_link 'Great flat near old street'

			within(:css, "li#landlord") do
	      click_link("Landlord")
	    end
	    
	    within(:css, "#form_for_user") do
	    	page.find("#star-landlord-3").trigger('click')
	      fill_in 'thoughts', with: 'Great landlord'
				click_button 'Leave review'
			end

			visit current_path

			within(:css, "li#landlord") do
				click_link("Landlord")
	    end

	    within(:css, "#form_for_user") do
	    	page.find("#star-landlord-5").trigger('click')
	      fill_in 'thoughts', with: 'Great landlord'
				click_button 'Leave review'
			end

			visit current_path

			within(:css, "li#landlord") do
				click_link("Landlord")
	    end

	    within(:css, "ul#landlord-tab") do
	    	expect(page).to have_content '★★★★☆'
	  	end
		end
	end

end