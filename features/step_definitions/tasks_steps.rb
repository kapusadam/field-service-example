Given /^I am on the Assignments screen$/ do

  user = USERS[:nat]
  to_assignments(:as => user)

end

When(/^I start recording on \#(\d+)$/) do |assignment|

  tap_record_for_assignment(:number => assignment)
  sleep(3) #we want a screenshot after 3 seconds
  screenshot_embed(:label => 'Recording')

end

Then /^the timer should start ticking$/ do
  check_timer_starts_ticking
end




Then /^I should see assignment #(\d+) titled "([^"]*)" as active$/ do |assignment_no, assignment_title|
  assert_assignment({:number => assignment_no, :title => assignment_title, :status => :active})
end

When /^I tap assignment #(\d+)$/ do |assignment_no|
  tap_and_store_assignment(:number => assignment_no)
end

