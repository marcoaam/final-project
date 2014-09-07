class ReviewsController < ApplicationController

	include ReviewsHelper

	def index
		params[:property_id] ? _show_reviews_of_one_property : _show_reviews_of_one_user
		@review = Review.new
	end

	def create
		params[:property_id] ? _create_review_for_property : _create_review_for_user
		redirect_to :back
	end
	
end
