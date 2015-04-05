Feature: User can view community collections

Scenario: View a creation
  Given I am on the home page
  When I follow "Community Collections"
  Then I should be on the Creations home page
