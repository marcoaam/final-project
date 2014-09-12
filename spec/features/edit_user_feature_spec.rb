require 'rails_helper'

describe 'Edit user' do
	context 'can show all the details of the user' do

		before(:each) do
		  john = create(:user)
			john.properties << create(:makers_academy)
			login_as john
		end

		it 'change the bio with bio and picture' do
			visit('/')
			click_link('Edit profile')
			fill_in 'user_bio', with: 'bio'
			attach_file 'user[image]', Rails.root.join('spec/images/Bob_razowski-1.jpg')
			click_button'Save'
			expect(current_path).to eq('/')
		end

		it 'can see his name' do
			visit('/')
			click_link('Edit profile')
			expect(page).to have_content('John')
		end

	end
end