require 'rails_helper'

describe 'User menu display' do

	context 'if logged out' do

		it 'display sign in' do
			visit('/')
			expect(page).to have_content('Sign in')
		end

		it 'display sign up' do
			visit('/')
			expect(page).to have_content('Sign up')
		end

	end

	context 'if logged in' do

		before(:each) do
			alex = create(:user)
			login_as alex
		end
	
		it 'display sign out' do
			visit('/')
			expect(page).to have_content('Sign out')
		end

		it 'can edit his profile' do
			visit '/'
			click_link 'Edit profile'
			fill_in 'user[bio]', with: "Easy going person"
			attach_file 'user[image]', Rails.root.join('spec/images/Bob_razowski-1.jpg')
			click_button 'Save'
			expect(page).to have_content 'Profile successfully saved'
		end

	end

	context 'js enabled' do

		before(:each) do
			create(:user)
		end

		it 'can sign up', js: true do
			visit ('/')
			click_link 'Sign up'
			within("#sign_up_modal") do
				fill_in ('user[username]'), with: 'marco', match: :prefer_exact
				fill_in ('user[email]'), with: 'm@m.com', match: :prefer_exact
				fill_in ('user[password]'), with: '12345678', match: :prefer_exact
				fill_in ('user[password_confirmation]'), with: '12345678', match: :prefer_exact
				click_button 'Subscribe'
			end
			expect(page).to have_content 'Welcome! You have signed up successfully.'
		end

		it 'can sign in', js: true do
			visit ('/')
			click_link 'Sign in'
			within("#sign_in_modal") do
				fill_in ('user[login]'), with: 'John', match: :prefer_exact
				fill_in ('user[password]'), with: '12345678', match: :prefer_exact
				click_button 'login'
			end
			expect(page).to have_content 'Signed in successfully.'
		end

	end

end