require 'rails_helper'

describe 'map' do
	context 'without markers', js: :true do
		it 'display the map after a search' do
			create(:makers_academy)
			search_home_for("25 city road,London,EC1Y 1AA")
			expect(page).to have_css('.gm-style')
		end
	end
end