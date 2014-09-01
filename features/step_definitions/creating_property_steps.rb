Given(/^I am on new property page$/) do
  visit('properties/new')
end

Given(/^I fill in title with "(.*?)"$/) do |arg1|
 fill_in :title, with: "awesome house"
end

Given(/^I fill in adress with "(.*?)"$/) do |arg1|
 fill_in :address, with: arg1
end

Given(/^I fill in city with "(.*?)"$/) do |arg1|
  fill_in :city, with: arg1
end

Given(/^I fill in postcode with "(.*?)"$/) do |arg1|
  fill_in :postcode, with: arg1
end

Given(/^I fill in description with "(.*?)"$/) do |arg1|
  fill_in :description, with: arg1
end

Given(/^I click button "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
