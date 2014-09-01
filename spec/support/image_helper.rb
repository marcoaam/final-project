def add_image
	visit('/properties/new')
	fill_in :property_title, with: 'title'
	attach_file 'property[pictures_attributes][0][images[]][]', Rails.root.join('spec/images/Bob_razowski-1.jpg')
	click_button 'Submit'
end

def add_many_images
	visit('/properties/new')
	fill_in :property_title, with: 'title'
	attach_file 'property[pictures_attributes][0][images[]][]', Rails.root.join('spec/images/Bob_razowski-1.jpg')
	attach_file 'property[pictures_attributes][0][images[]][]', Rails.root.join('spec/images/Bob_razowski-2.jpg')
	attach_file 'property[pictures_attributes][0][images[]][]', Rails.root.join('spec/images/Bob_razowski-3.jpg')
	click_button 'Submit'
end