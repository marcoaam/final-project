class PropertiesController < ApplicationController

	def index
		@properties = Property.all
	end

	def new
		@property = Property.new
	end
	
	def create
		Property.create(params[:property].permit(:title, :address, :postcode, :city, :description))
		redirect_to '/properties'
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		@property.update(params[:property].permit(:title, :address, :postcode, :city, :description))
		redirect_to '/properties'
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy
		redirect_to '/properties'
	end

	def show
		@property = Property.find(params[:id])
	end

end
