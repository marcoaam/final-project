Feature: Searching for a room
	In order to find a room
	I want to search for it by location

	Scenario: Searching by address
		Given  I am on the homepage
		And I fill in the search bar with an address
		Then I should see a map with the results
		And I should see a list of properties
