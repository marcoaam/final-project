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
		3.times { @property.pictures.build }
	end
	
	def create
		@property = Property.new(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
		@property.save

		respond_to do |format|
			if @property.save
				if params[:image]
					params[:image].each do |image|
						@property.pictures.create(image: image)
					end
				end
				format.html { redirect_to @property, notice: 'The property has been successfully created' }
				format.json { render json: @property, status: :created, location: @property }
			else
				format.html { render action: "new"}
				format.json { render json: @property.errors, status: :unprocessable_entity }
				redirect_to '/properties'
			end
		end	
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		@property.update(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
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
