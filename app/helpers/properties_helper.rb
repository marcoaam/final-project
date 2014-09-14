module PropertiesHelper

  private

  def finding_nearby
    Property.near(params[:search_bar], 2 )
  end

  def gmap_caller(properties)
    @hash = Gmaps4rails.build_markers(properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
    end
  end

  def user_properties
    @properties = User.find_by(id: params[:user_id]).properties
    gmap_caller(@properties)	
  end

  def nearby_properties
    @properties = finding_nearby
    gmap_caller(@properties)
  end

  def new_property_for_current_user
    current_user.properties.new(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
  end

  def respond_to_property_creation
    respond_to do |format|
      if @property.save
        create_image_if_not_nil
        format.html { redirect_to @property, notice: 'The property has been successfully created' }
      else
        format.html { redirect_to '/properties/new', alert: 'The property cannot have more than 5 or less than 0 rooms'}
      end
    end	
  end

  def create_image_if_not_nil
    if params[:image]
      params[:image].each do |image|
        @property.pictures.create(image: image)
      end
    end
  end

  def update_property_with_new_params
    @property.update(params[:property].permit(:title, :address, :postcode, :city, :total_rooms, :description, pictures_attributes: :image))
  end

end