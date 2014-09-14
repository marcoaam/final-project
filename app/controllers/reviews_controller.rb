class ReviewsController < ApplicationController

	include ReviewsHelper

	before_action :authenticate_user!, except: [:index]

	def index
		params[:property_id] ? show_reviews_of_one_property : show_reviews_of_one_user
		@review = Review.new
	end

	def create
		params[:property_id] ? @review = create_review_for_property : @review = create_review_for_user
		if @review.save!		
			render 'create.json'
		else
			render json: @review.errors.full_messages
		end
	end
	
end
