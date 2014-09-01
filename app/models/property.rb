class Property < ActiveRecord::Base

	has_many :rooms

	has_many :pictures, :dependent => :destroy
	accepts_nested_attributes_for :pictures
	
	def total_rooms
	end

	def total_rooms=(number)
		1.upto(number.to_i) do |n|
			self.rooms << Room.create(number: n)
		end 
	end


end
