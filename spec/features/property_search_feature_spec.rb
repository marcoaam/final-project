require 'rails_helper'

describe 'Property Search' do

	before(:each) do
		john = create(:user)
		login_as john
		john.properties << create(:london_victoria)
		john.properties << create(:makers_academy)
	end

	it 'can search by address' do
		visit '/'
		fill_in 'search_bar', with: '25 city road,London,EC1Y 1AA'
		click_button 'Search'
		expect(page).to have_content 'Great flat near old street'
		expect(page).not_to have_content 'London Victoria'
	end
	
end
