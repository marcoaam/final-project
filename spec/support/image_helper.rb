def add_image
	visit('/properties/new')
	fill_in :property_title, with: 'title'
	attach_file 'property_pictures_attributes_0_image', Rails.root.join('spec/images/Bob_razowski-1.jpg')
	click_button 'Submit'
end