require 'rails_helper'

RSpec.describe Picture, :type => :model do

	context 'property' do

		let(:property) do
			create(:makers_academy)
		end

		it 'can add 1 picture to the database' do
			picture = property.pictures.new
			picture.save
			expect(Picture.count).to eq 1
		end

		it 'cannot upload more than 3 pictures' do
			3.times { @picture = property.pictures.new }
			@picture.save
			expect(Picture.count).to eq 1
			picture = property.pictures.new 
			picture.save
			expect(property).to have(1).error_on(:pictures)
		end 
  end

  context 'User' do

  	before(:each) do
		  @john = create(:user)
			@john.properties << create(:makers_academy)
			login_as @john
		end

		it 'can add 1 picture to the database' do
			picture = @john.pictures.new
			picture.save
			expect(Picture.count).to eq 1
		end

		it 'cannot upload more than 1 pictures' do
			3.times { @picture = @john.pictures.new }
			@picture.save
			expect(Picture.count).to eq 1
			picture = @john.pictures.new 
			picture.save
			expect(@john).to have(1).error_on(:pictures)
		end 
  end
end
