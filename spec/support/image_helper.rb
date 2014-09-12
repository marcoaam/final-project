def add_image
	visit('/properties/new')
	fill_in :property_title, with: 'title'
	fill_in :property_address, with: "25 city road"
	fill_in :property_postcode, with: "EC1Y 1AA"
	fill_in :property_city, with: "London"
	fill_in :property_description, with: "New one"
	attach_file 'property_pictures_attributes_0_image', Rails.root.join('spec/images/Bob_razowski-1.jpg')
	click_button 'Submit'
end

def add_many_images
	visit('/properties/new')
	fill_in :property_title, with: 'title'
	fill_in :property_address, with: "25 city road"
	fill_in :property_postcode, with: "EC1Y 1AA"
	fill_in :property_city, with: "London"
	fill_in :property_description, with: "New one"
	attach_file 'property_pictures_attributes_0_image', Rails.root.join('spec/images/Bob_razowski-1.jpg')
	attach_file 'property_pictures_attributes_0_image', Rails.root.join('spec/images/Bob_razowski-2.jpg')
	attach_file 'property_pictures_attributes_0_image', Rails.root.join('spec/images/Bob_razowski-3.jpg')
	click_button 'Submit'
end