class PropertiesController < ApplicationController

	def index
		@properties = Property.all
	end

	def new
		@property = Property.new
		@property.pictures.build
	end
	
	def create
		@property = Property.create(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: [:id, :image]))
		#params[:images].each do |image|
		#	@property.pictures.create(image: image)
		#end
		redirect_to '/properties'
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		@property.update(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, :picture))
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
