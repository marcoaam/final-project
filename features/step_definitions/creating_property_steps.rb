Given(/^I am on new property page$/) do
  visit('property/new')
end

Given(/^I fill in title with "(.*?)"$/) do |arg1|
 fill_in title, with: "Awesome House"
end

Given(/^I fill in adress line (\d+) with "(.*?)"$/) do |arg1, arg2|
  fill_in address_line_1, with: "15"
end

Given(/^I fill in postcode with "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I fill in description with "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I click button "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
