require 'rails_helper'

RSpec.describe ReviewsHelper, :type => :helper do
 
  it 'returns No rating if there is no rating' do
    expect(helper.star_rating('string')).to eq 'No rating'
  end

  it 'returns five full stars if the rating is 5 or 5.0' do
    expect(helper.star_rating(5.0)).to eq '★★★★★'
  end

  it 'returns four full stars and one empty if the rating is 4 or 4.0' do
    expect(helper.star_rating(4.0)).to eq '★★★★☆'
  end
  
end
