require 'rails_helper'

describe 'Property' do

	before(:each) do
		Property.create(title: 'Great flat near old street')
	end

	it 'shows a list of properties' do
		visit '/properties'
		expect(page).to have_content 'Great flat near old street'
	end

end