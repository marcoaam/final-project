Feature: Creating a property
	In order to create a property 
	as a user
	I can complete the required field
	
@property_form
Scenario: Complete the form 
	Given I am on new property page
	And I fill in title with "awesome house"
	And I fill in adress line 1 with "Flat 15, walton house"
	And I fill in adress line 2 with "montclare street"
	And I fill in postcode with "E2 7ET"
	And I fill in description with "blablabla"
	And I click button "Submit"
	Then I should see "your post has been created"
