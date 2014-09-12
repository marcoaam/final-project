require 'rails_helper'

describe 'Stars for rating' do

  context 'without reviews' do

    before(:each) do
      john = create(:user)
      makers_academy = create(:makers_academy)
      john.properties << makers_academy
    end

    it 'has 5 empty stars when the property doesnt have reviews' do
      visit '/'
      search_home_for('25 city road,London,EC1Y 1AA')
      expect(page).to have_content 'No rating'
    end

  end


  context 'With reviews' do

    before(:each) do
      john = create(:user)
      makers_academy = create(:makers_academy)
      john.properties << makers_academy
      makers_academy.reviews << create(:review)
    end

    it 'has 5 empty stars when the property doesnt have reviews' do
      visit '/'
      search_home_for('25 city road,London,EC1Y 1AA')
      expect(page).to have_content '★★☆☆☆'
    end

  end

end