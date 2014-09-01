class Property < ActiveRecord::Base

	has_many :rooms

	def total_rooms
	end

	def total_rooms=(number)
		1.upto(number.to_i) do |n|
			Room.create(number: n, property_id: self.id)
		end 
	end

end
