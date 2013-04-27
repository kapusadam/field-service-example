
Given /^I am on the Login screen$/ do
  await(LoginScreen)
  screenshot_embed(:label => 'Login')
end

When /^I login as "([^"]*)"$/ do |user_str|
  user = USERS[user_str.downcase.to_sym]
  login(:as => user)
end

Then /^I should go to the Assignments screen$/ do
  assert_screen(AssignmentsScreen)
  screenshot_embed(:label => 'Assignments')
end

Then /^I should not be logged in$/ do
  assert_screen(LoginScreen)
end

And /^I should see a login error message$/ do
  assert_login_error_message
end