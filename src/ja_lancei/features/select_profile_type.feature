Feature: Select profile type

As a user 
I want to choose the profile type that I want to access
So that I can access the application with the right profile type

Scenario: user is a P.O.
    Given I am on the root page
    When I click the Sou um P.O., C.T.O, etc. button
    Then I should see the Welcome P.O. page

Scenario: user is a Collaborator
    Given I am on the root page
    When I click the Sou um colaborador button
    Then I should see the Welcome Collaborator page