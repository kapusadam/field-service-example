# Xamarin Field Service pre-built app Calabash Example

Much more info to come here soon. Also follow blog posts for more info on how to setup Calabash.


## Running the login feature on iPad

Build the iOS app in debug mode for iPad.
(Should put a file in FieldService.iOS/bin/iPhoneSimulator/Debug/FieldServiceiOS.app)

Run test:

    krukow:~/github/FieldServiceExample$ cucumber -p ios features/login.feature
    Using the ios profile...
    Feature: Login

      Scenario: Login with valid user              # features/login.feature:3
      Waiting for App to be ready
        Given I am on the Login screen             # features/step_definitions/login_steps.rb:2
        When I login as "Nat"                      # features/step_definitions/login_steps.rb:7
        Then I should go to the Assignments screen # features/step_definitions/login_steps.rb:12

        Scenario: Login with invalid user        # features/login.feature:9
        Waiting for App to be ready
         Given I am on the Login screen         # features/step_definitions/login_steps.rb:2
         When I login as "Invalid"              # features/step_definitions/login_steps.rb:7
         Then I should not be logged in         # features/step_definitions/login_steps.rb:17
         Expected LoginScreen screen but was AssignmentsScreen (RuntimeError)
          ./features/support/entry_points.rb:22:in `assert_screen'
          ./features/step_definitions/login_steps.rb:18:in `/^I should not be logged in$/'
          features/login.feature:12:in `Then I should not be logged in'
         And I should see a login error message # features/step_definitions/login_steps.rb:21

    Failing Scenarios:
    cucumber -p ios features/login.feature:9 # Scenario: Login with invalid user

    2 scenarios (1 failed, 1 passed)
    7 steps (1 failed, 1 skipped, 5 passed)
    0m18.388s
