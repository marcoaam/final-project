Feature: map shows the markers
	In order to get the markers
	As a person who did the research
	I want to see where are the available flats as a markers

	Scenario: I can see the markers on the page 
		Given I did a research
		Then I should see the markers
		And I can click on the markers
		Then I will be on the property page