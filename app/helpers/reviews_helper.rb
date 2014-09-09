module ReviewsHelper

	def _show_reviews_of_one_property
		@property = Property.find(params[:property_id])
		@reviews = @property.reviews.all
	end

	def _show_reviews_of_one_user
		@user = User.find(params[:user_id])
		@reviews = @user.reviews.all
	end

	def _create_review_for_property
		property = Property.find(params[:property_id])
		property.reviews.create(params[:review].permit(:thoughts, :rating))
	end

	def _create_review_for_user
		user = User.find(params[:user_id])
		user.reviews.create(thoughts: params[:thoughts], rating: params[:rating])
	end

	def star_rating(rating)
		return 'No rating' unless rating.respond_to?(:round)
		remainder = 5 - rating.round
		('★' * rating.round) + ('☆' * remainder)
	end

end
