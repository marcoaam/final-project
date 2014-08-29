Feature: I am on the flat page
	In order to have a great user experience
	As a user
	I want to see two colums

	Scenario: See the page
		Given I am on the flat page
		Then I should see a owner column
		And I should see a flat column 

	Scenario: The owner column
		Given I see the owner column 
		Then I should see the average rating of the owner
		And I should see 3 reviews
		And I should be able to leave a review (if I am logged in)

	Scenario: The owner column
		Given I see the owner column 
		Then I should see the average rating of the owner
		And I should see 3 reviews
		And I should be able to leave a review (if I am logged in)

	Scenario: The flat column
		Given I see the flat column
		Then I should the average rating of the flat
		And I should see the names/pictures/nationality/staying length of the tenants
		And I should see 3 reviews of you
		And I should be able to leave a review (if I am logged in)

