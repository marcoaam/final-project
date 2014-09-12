class Review < ActiveRecord::Base

	validates :rating, inclusion: { within: (1..5), message: "Sorry, you need to add stars" }
	
	belongs_to :imageable, polymorphic: true

  def user
    User.find_by(id: self.user_id)
  end

end