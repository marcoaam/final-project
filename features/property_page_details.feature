Feature: I am on the flat page
	In order to have a great user experience
	As a user
	I want to see two colums

	Scenario: What people see
		Given I am on the property page
		Then I should see the property pictures
		And I should see the title and the address
		And I should see the flat page
		And I should see a link to the room n (availale/not available)

	Scenario: See the page
		Given I am on the flat page
		Then I should see a owner column
		And I should see a flat column 

	Scenario: The owner column
		Given I see the owner column 
		Then I should see the average rating of the owner
		And I should see the profile display of the user
		And I should see 3 reviews
		And I should be able to leave a review (if I am logged in)

	Scenario: The room column
		Given I see the room column 
		Then I should see the description of the room
		And I should see the profile display of the user
		And I should see 3 reviews
		And I should be able to leave a review (if I am logged in)

	Scenario: The flat column
		Given I see the flat column
		Then I should the average rating of the flat
		And I should see the names/pictures/nationality/staying length of the tenants
		And I should see 3 reviews of you
		And I should be able to leave a review (if I am logged in)

