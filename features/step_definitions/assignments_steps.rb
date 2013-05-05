Given /^I am on the Assignments screen$/ do

  user = USERS[:nat]
  to_assignments(:as => user)

end








Then /^I should see assignment #(\d+) titled "([^"]*)" as active$/ do |assignment_no, assignment_title|
  assert_assignment({:number => assignment_no, :title => assignment_title, :status => :active})
end

When /^I tap assignment #(\d+)$/ do |assignment_no|
  tap_and_store_assignment(:number => assignment_no)
end

When(/^I start recording on \#(\d+)$/) do |assignment|

  tap_record_for_assignment(:number => assignment)
  sleep(3) #we want an image after 3 seconds
  screenshot_embed(:label => 'Recording')
end

Then /^the timer should start ticking$/ do
  check_timer_starts_ticking
end


Given(/^I am in Adrian, TX$/) do
  pending
end

When(/^I go to the Map screen$/) do
  pending
end

Then(/^I should see my location on the map$/) do
  pending
end

And(/^the assignment \#(\d+) on "(.*?)"$/) do |assignment_no, title|
  pending
end

Given(/^I am on the Assignments Details screen for \#(\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I want to complete the assignment$/) do
  pending # express the regexp above with the code you wish you had
end

Then /^I am required to sign$/ do
  pending
end
When /^then I can complete the assignment$/ do
  pending
end