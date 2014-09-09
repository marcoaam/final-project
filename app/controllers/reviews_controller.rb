class ReviewsController < ApplicationController

	include ReviewsHelper

	def index
		params[:property_id] ? _show_reviews_of_one_property : _show_reviews_of_one_user
		@review = Review.new
	end

	def create
		if params[:property_id] 
			property = Property.find(params[:property_id])
			review = property.reviews.create(params[:review].permit(:thoughts, :rating))
		else 
			review = _create_review_for_user
		end

		if review.save
			render json: review
		# else
		# 	render json: review.errors.full_messages
		end
			#redirect_to :back
	end
	
end
