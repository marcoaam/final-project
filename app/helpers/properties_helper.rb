module PropertiesHelper

	private

	def _finding_nearby
		Property.near(params[:search_bar], 2 )
	end

	def _gmap_caller(properties)
		@hash = Gmaps4rails.build_markers(properties) do |property, marker|
		  marker.lat property.latitude
		  marker.lng property.longitude
		end
	end

	def _user_proprieties
		@properties = User.find_by(id: params[:user_id]).properties
		_gmap_caller(@properties)	
	end

	def _nearby_proprieties
		@properties = _finding_nearby
		_gmap_caller(@properties)
	end

	def _new_property_for_current_user
		current_user.properties.new(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
	end

	def _respond_to_propriety_creation
		respond_to do |format|
			if @property.save
				_create_image_if_not_nil
				format.html { redirect_to @property, notice: 'The property has been successfully created' }
			else
				format.html { redirect_to '/properties/new', alert: 'The property cannot have more than 5 or less than 0 rooms'}
			end
		end	
	end

	def _create_image_if_not_nil
		if params[:image]
			params[:image].each do |image|
				@property.pictures.create(image: image)
			end
		end
	end

	def _update_property_with_new_params
		@property.update(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
	end


end
