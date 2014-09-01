require 'rails_helper'

RSpec.describe Picture, :type => :model do

	it 'can add 1 picture to the database' do
		picture = Picture.new
		picture.save
		expect(Picture.count).to eq 1
	end

	it 'save the image_file_name' do
		picture = Picture.create(image: Rails.root.join('spec/images/Bob_razowski-1.jpg'))
		byebug
		puts picture.inspect
		picture.save
		expect(Picture.image_file_name).to eq "Bob_razowski-1.jpg"
	end
  
end
