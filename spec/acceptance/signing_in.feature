Feature: Authorization:
  Background:
    Given I'm at the homepage
    And I sign in as "alice"

  Scenario: Signing in once:
    Then I should be signed in as "alice"

  Scenario: Logging out
    Then I sign out
    And I should not be signed in
