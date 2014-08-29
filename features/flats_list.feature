Feature: listing the availabale flats after a research
	In order to see the list of available flats
	As a person who did the research
	I want to see the flats related to the markers

	Scenario: A user click on a property link
		Given I searched for a property
		And I click on the property
		Then I should be on the property page
