require 'rails_helper'

RSpec.describe Picture, :type => :model do

	it 'can add 1 picture to the database' do
		picture = Picture.new
		picture.save
		expect(Picture.count).to eq 1
	end
  
end
