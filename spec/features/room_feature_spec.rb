require 'rails_helper'

describe 'Room' do

	it 'creates a number of rooms when a property is created' do
		Property.create(title: "room creation", room: 3)
		expect(Room.count).to eq 3
	end

end