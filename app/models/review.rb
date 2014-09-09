class Review < ActiveRecord::Base

	validates :rating, inclusion: { within: (1..5), message: "Sorry, you need to put stars" }
	
	belongs_to :imageable, polymorphic: true

end