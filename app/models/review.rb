class Review < ActiveRecord::Base

	validates :rating, inclusion: (1..5)
	
	belongs_to :property
	belongs_to :user
	end



