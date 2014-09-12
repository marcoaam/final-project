require 'rails_helper'
	
	describe 'List of properties' do
		
		context 'display' do
			
			before(:each) do
			  john = create(:user)
				john.properties << create(:makers_academy)
				login_as john
			end

			it 'address in a full format' do
				
				visit('/')
				click_link('My properties')
				expect(page).to have_content('25 city road London, EC1Y 1AA')
			end

			it 'edit and delete options only to author of posts' do
				
				visit('/')
				click_link('My properties')
				expect(page).to have_content('25 city road London, EC1Y 1AA')
				expect(page).to have_content('Edit')
				expect(page).to have_content('Delete')
				expect(page).not_to have_content('Posted by')
			end

			it 'the author of the post if is not the user logged' do
				
				logout
				visit('/')
				fill_in 'search_bar', with: '25 city road,London,EC1Y 1AA'
				click_button('Search')
				expect(page).to have_content('Posted by')
				expect(page).not_to have_content('Edit')
			end
	
		end
	
	end