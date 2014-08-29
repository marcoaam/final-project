Feature: Visiting the property page
	In order be able to see the good infos
	As a user
	I want to see a bunch of stuff ? 

	Scenario: What people see
		Given I am on the property page
		Then I should see the property pictures
		And I should see the title and the address
		And I should see the flat page
		And I should see a link to the room n (availale/not available)
