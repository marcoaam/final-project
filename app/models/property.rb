class Property < ActiveRecord::Base

	geocoded_by :full_address
	after_validation :geocode, :if => :address_changed?

	belongs_to :user

	has_many :rooms

	has_many :reviews, as: :imageable

	has_many :pictures, as: :imageable, :dependent => :destroy
	
	accepts_nested_attributes_for :pictures

	def total_rooms
	end

	def total_rooms=(number)
		1.upto(number.to_i) do |n|
			self.rooms << Room.create(number: n)
		end
	end

	def full_address
		"#{self.address},#{self.city},#{self.postcode}"
	end

	def display_full_address
		"#{self.address} #{self.city}, #{self.postcode}"
	end

	def average_rating
		if self.reviews.empty?
			"No reviews have been added."
		else 
			reviews.average(:rating)
		end
	end

	def pluralized_review
		self.reviews.count < 2 ? "review" : "reviews"
	end

end