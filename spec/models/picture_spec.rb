require 'rails_helper'

RSpec.describe Picture, :type => :model do

	it 'can add 1 picture to the database' do
		picture = Picture.new
		picture.save
		expect(Picture.count).to eq 1
	end

	it 'cannot upload more than 3 pictures' do
		3.times { @picture = Picture.new }
		@picture.save
		expect(Picture.count).to eq 1
		picture = Picture.new 
		picture.save
		expect(picture).to have(1).error_on(:image)
	end 
  
end
