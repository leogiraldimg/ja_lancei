Feature: Sign up as manager 

As a manager
I want to create an account
So that I can use the application

Scenario: User creates a new manager account filling all fields with valid data
    Given I am on the create manager account page
    When I fill the manager registration form
    And I click the Cadastrar button
    Then I should see the Welcome P.O. page