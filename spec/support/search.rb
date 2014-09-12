def search_home_for(query)
	visit '/'
	fill_in :search_bar, with: query
	click_button 'Search'
end