Feature: 'Initialize'

  Scenario: 'Login'
    When I visit page "http://new.timetoriot.com/jobs"
    And Wait until all ajax request finished
    Then I see a text "Jobs"

