Feature: Assignments
  As a user I'll be able to manage
  available assignments. I can work on assignments,
  see detailed information including an integrated
  map.

  @track
  Scenario: Work on Assignment
    Given I am on the Assignments screen
    When I start recording on #2001
    Then the timer should start ticking

  @map
  Scenario: Assignment represented on map
    Given I am in Adrian, TX
    When I go to the Map screen
    Then I should see my location on the map
    And the assignment #2001 on "306 5th Street Adrian"

  @complete
  Scenario: Assignment completion
    Given I am on the Assignments Details screen for #2001
    When I want to complete the assignment
    Then I am required to sign
    And then I can complete the assignment
