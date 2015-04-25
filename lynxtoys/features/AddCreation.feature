Feature: User can manually add movie
 
Scenario: Add a creation
  Given I am on the Creations home page
  When I press "New Creation"
  Given I am on the Create New Creation page
  When I fill in "creation[name]" with "Awesome creation"
  And I fill in "creation[creator_name]" with "Alice"
  And I fill in "creation[description]" with "A Dragon"
  And I fill in "creation[email]" with "user@gmail.com"
  When I upload some pictures
  Then I should be on the show page of the new creation 
