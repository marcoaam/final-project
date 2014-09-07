class PropertiesController < ApplicationController

	include PropertiesHelper

	before_action :authenticate_user!, except: [:index, :show]

	def index
		params[:user_id] ? _user_proprieties	: _nearby_proprieties
	end

	def new
		@property = Property.new
		3.times { @property.pictures.build }
	end
	
	def create
		@property = _new_property_for_current_user
		@property.save
		_respond_to_propriety_creation
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		_update_property_with_new_params
		redirect_to '/properties'
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy
		redirect_to "/user/#{current_user.id}/properties"
	end

	def show
		@property = Property.find(params[:id])
		@review   = Review.new
		@reviews  = @property.reviews
	end

end
