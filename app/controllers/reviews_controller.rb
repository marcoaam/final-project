class ReviewsController < ApplicationController

	include ReviewsHelper

	def index
		params[:property_id] ? _show_reviews_of_one_property : _show_reviews_of_one_user
		@review = Review.new
	end

	def show
		@review = Review.find(params[:id])
	end

	def create
		params[:property_id] ? @review = _create_review_for_property : @review = _create_review_for_user
		unless @review.save!
			#render json: review 
			# render json: { review: review, user: current_user }
		# else			
			render json: @review.errors.full_messages
		end
			#redirect_to :back
	end
	
end
