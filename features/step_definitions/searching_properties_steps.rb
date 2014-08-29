Given(/^I fill in the search bar with an address$/) do
  fill_in :search, with: 'bananas'
end

Then(/^I should see a map with the results$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of properties$/) do
  pending # express the regexp above with the code you wish you had
end