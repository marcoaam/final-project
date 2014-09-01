class PropertiesController < ApplicationController

	def index
		if params[:user_id]
			@properties = User.find_by(id: params[:user_id]).properties	
		else
			@properties = finding_nearby
		end
	end

	def new
		@property = Property.new
	end
	
	def create
		Property.create(params[:property].permit(:title, :address, :postcode, :city, :total_rooms,:description))
		flash[:notice] = 'Property successfully created.'
		redirect_to '/properties'
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		@property.update(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description))
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

	def finding_nearby
		Property.near(params[:search_bar],2)
	end
	
end
