Feature: 'TimeToRiot automated test'

  Scenario: 'Check fields, inputs, buttons on the page'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I should see an inputs: "company,email,link,title,location,salary,currency,publish-at,apply-by"
    And I should see text area "description"
    And I should see hidden inputs "available,featured"
    And See buttons "Cancel" and "Save"

  Scenario: 'Check all required fields before post new job'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I click on button "Post"
    Then I should see error for required fields "company,email,link,title,location,salary,currency,publish-at,apply-by,description"

  Scenario: 'Check incorrect fill client name'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "asd" in "company" field
    Then I see an error "Company is required"

  Scenario: 'Check correct fill client'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "Mastiff" in "company" field
    Then I don't see an error "Company is required"

  Scenario: 'Check invalid fill email address'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "email" in "email" field
    Then I see an error "This is not a valid e-mail address"

  Scenario: 'Check correct fill email address'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "email@email" in "email" field
    Then I don't see an error "This is not a valid e-mail address"
    And Field "link" are disabled

  Scenario: 'Check invalid fill link address'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "link" in "link" field
    Then I see an error "This is not a valid URL"

  Scenario: 'Check correct fill link address'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "http://google.com" in "link" field
    Then I don't see an error "This is not a valid URL"
    And Field "email" are disabled

  Scenario: 'Check impossibility to fill symbols in salary field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "some_text" in "salary" field
    Then I see an error "This is not a valid number"

  Scenario: 'Check possibility to fill correct value in salary field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "500" in "salary" field
    Then I don't see an error "This is not a valid number"

  Scenario: 'Check impossibility to fill custom currency in currency field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "asd" in "currency" field
    Then I see an error "Currency is required"

  Scenario: 'Check impossibility to fill custom currency value in currency field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "asd" in "currency" field
    Then I see an error "Currency is required"

  Scenario: 'Check possibility to fill correct currency value in currency field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "EUR" in "currency" field
    Then I don't see an error "Currency is required"

  Scenario: 'Check impossibility to fill incorrect publish-at date in publish-at field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "2012-08-24" in "publish-at" field
    Then I see an error class "ng-invalid" in "publish-at" field

  Scenario: 'Check impossibility to fill incorrect apply-by date in apply-by field'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "2016-08-24" in "apply-by" field
    Then I see an error class "ng-invalid" in "apply-by" field

  @correct
  Scenario: 'Correct post Job'
    When I visit page "http://new.timetoriot.com/jobs"
    And I see a button "Add"
    Then I click on button "Add"
    And I fill text "Mastiff" in "company" field
    And I fill text "yegordanchenko@gmail.com" in "email" field
    And I fill text "Automated QA" in "title" field
    And I fill text "Ukraine" in "location" field
    And I fill text "600" in "salary" field
    And I fill text "USD" in "currency" field
    And I fill text "2017-08-24" in "publish-at" field
    And I fill text "2017-08-24" in "apply-by" field
    And I fill text "Best job" in "fr-code" textarea
    And I click on button "Post"
    Then Url should be "http://new.timetoriot.com/jobs"
    And I see a text "Automated QA"